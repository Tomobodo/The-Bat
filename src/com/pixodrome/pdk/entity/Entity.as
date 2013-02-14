package com.pixodrome.pdk.entity {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.ComponentList;
	import com.pixodrome.pdk.core.IDestroyable;
	import com.pixodrome.pdk.core.Scene;
	/**
	 * @author Thomas
	 */
	public class Entity implements IDestroyable{
		
		protected var mDeltaTime : Number;
		protected var mComponents : ComponentList;
		protected var mAdded : Boolean;
		
		public var scene : Scene;
		public var tag : String;
		
		public var previous : Entity;
		public var next : Entity;
		
		function Entity(){
			mComponents = new ComponentList();
		}
		
		public function onAdded():void{
			var comp : Component = mComponents.getHead();
			for(;comp;comp = comp.next)
				comp.onCreate();
			mAdded = true;
		}
		
		public function add(component:Component):Entity{
			component.entity = this;
			
			mComponents.add(component);	
			if(mAdded)
				component.onCreate();	
			
			return this;
		}
		
		public function remove(compClass:Class):void{
			mComponents.removeByClass(compClass);
		}
		
		public function getComponent(compClass:Class):*{
			return mComponents.getComponent(compClass);
		}
		
		public function update(deltaTime:Number):void{
			var comp : Component = mComponents.getHead();
			for(; comp; comp = comp.next)
				comp.onUpdate(deltaTime);
		}
		
		public function sendMessage(message:String, params:Object, from:Component):void
		{
			var comp : Component = mComponents.getHead();
			for(;comp;comp = comp.next)
				if(comp != from)
					comp.onMessage(message, params);
		}
		
		public function toString() : String {
			if(tag)
				return tag;
			else
				return "Entity";
		}

		public function destroy() : void {
			var comp : Component;
			while(comp = mComponents.getHead()){
				comp.destroy();
				mComponents.remove(comp);
			}
		}
	}
}
