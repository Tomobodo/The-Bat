package com.pixodrome.pdk {
	import flash.utils.Dictionary;
	/**
	 * @author Thomas
	 */
	public class Scene implements IDestroyable {
		
		private var mEntitys : Vector.<Entity>;
		private var mEntityMap : Dictionary;
		private var mEntityNumber : uint;
		
		function Scene() {
			
			mEntitys = new Vector.<Entity>();
			mEntityMap = new Dictionary();
			
			onCreate();
		}

		public function update(deltaTime : uint) : void {
			for(var i : uint = 0; i < mEntityNumber; ++i)
				mEntitys[i].update(deltaTime);
		}

		public function onCreate() : void {
		}
		
		public function add(entity : Entity, name : String):void{
			entity.name = name;
			entity.scene = this;
						
			mEntitys.push(entity);
			
			if(!mEntityMap[name])
				mEntityMap[name] = new Vector.<Entity>();
			mEntityMap[name].push(entity);
			
			++mEntityNumber;
			
			entity.init();
		}
		
		public function destroy() : void {
			while(mEntityNumber > 0)
			{
				--mEntityNumber;
				mEntitys.pop().destroy();
			}
		}
	}
}
