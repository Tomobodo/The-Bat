package com.pixodrome.pdk {
	import flash.utils.Dictionary;
	/**
	 * @author Thomas
	 */
	public class Entity implements IDestroyable{
		
		private var mComponents : Vector.<Component>;
		private var mComponentsMap : Dictionary;
		private var mComponentsNumber : uint;
		
		protected var mDeltaTime : Number;
		
		public var name : String;
		public var scene : Scene;
		
		function Entity(){
			mComponents = new Vector.<Component>();
			mComponentsMap = new Dictionary();
		}
		
		private function initComponents() : void {
			for(var i:uint = 0; i < mComponentsNumber; ++i)
				mComponents[i].onCreate();
		}
		
		public function add(component:Component, name : String):void{
			mComponentsMap[name] = component;
			mComponents.push(component);
			++mComponentsNumber;
		}
		
		public function update(deltaTime:Number):void{
			for(var i:uint = 0; i < mComponentsNumber; ++i)
				mComponents[i].onUpdate(deltaTime);
		}
		
		public function init():void{
			onCreate();
			initComponents();
		}

		public function onCreate():void{
			
		}

		public function destroy() : void {
			while(mComponents.length > 0)
				mComponents.pop().destroy();
		}
	}
}
