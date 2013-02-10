package com.pixodrome.pdk.component {
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.Component;

	/**
	 * @author Thomas
	 */
	public class EntitySpawner extends Component {
		
		private var mTransform : Transform2D;
		
		public static const MESSAGE_SPAWN : String = "spawn";
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
		}
		
		override public function onMessage(message : String, params : Object) : void {
			if(message == MESSAGE_SPAWN){
				var prefabClass : Class = params as Class;
				var spawned : Entity = (new prefabClass) as Entity;
				var spawnedTransform : Transform2D = spawned.getComponent(Transform2D);
				spawnedTransform.x = mTransform.x;
				spawnedTransform.y = mTransform.y;
				Scene.current.add(spawned);
			}
		}
		
	}
}
