package com.pixodrome.pdk.core {
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.entity.EntityList;
	/**
	 * @author Thomas
	 */
	public class Scene implements IDestroyable {
		
		private var mEntitysToDestroy : Vector.<Entity>;
		
		protected var mEntitys : EntityList;
		
		public static var current : Scene ;
		
		function Scene() {
			current = this;
			mEntitys = new EntityList();
			mEntitysToDestroy = new Vector.<Entity>();
		}

		public function update(deltaTime : Number) : void {
			var entity : Entity = mEntitys.getHead();
			for(entity; entity; entity = entity.next)
				entity.update(deltaTime);
				
			while(mEntitysToDestroy.length > 0){
				var entity : Entity = mEntitysToDestroy.pop();
				mEntitys.remove(entity);
				entity.destroy();
			}
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
		
		public function getNbEntity():uint{
			return mEntitys.getNbEntity();
		}
		
		public function showTag():void{
			mEntitys.showTag();
		}
		
		public function remove(entity : Entity):void{
			mEntitysToDestroy.push(entity);
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
