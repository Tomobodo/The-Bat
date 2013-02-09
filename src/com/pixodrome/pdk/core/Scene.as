package com.pixodrome.pdk.core {
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.entity.EntityList;
	/**
	 * @author Thomas
	 */
	public class Scene implements IDestroyable {
		
		protected var mEntitys : EntityList;
		
		function Scene() {
			mEntitys = new EntityList();
		}

		public function update(deltaTime : Number) : void {
			var entity : Entity = mEntitys.getHead();
			for(entity; entity; entity = entity.next)
				entity.update(deltaTime);
		}

		public function add(entity : Entity):void{
			entity.scene = this;
			entity.onAdded();
			mEntitys.add(entity);
		}
		
		public function getEntitys():Entity{
			return mEntitys.getHead();
		}
		
		public function getTag(tag:String):Entity{
			return mEntitys.getTag(tag);
		}
		
		public function showTag():void{
			mEntitys.showTag();
		}
		
		public function remove(entity : Entity):void{
			mEntitys.remove(entity);
			entity.destroy();
		}
		
		public function destroy() : void {
			var ent:Entity = mEntitys.getHead();
			while(ent)
			{
				ent.destroy();
				ent = ent.next;
			}
			
			mEntitys.removeAll();
		}
	}
}
