package com.pixodrome.theBat.entitys.stalagmytes {
	import com.pixodrome.pdk.component.Trigger.DistanceTrigger;
	import com.pixodrome.pdk.component.display.d2.Rendering;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.entity.Entity;
	/**
	 * @author Thomas
	 */
	public class Stalagmyte extends Entity {
		
		public static const TAG_STALGMYTE : String = "Stalagmyte";
		
		public function Stalagmyte() {
			super();
			
			tag = TAG_STALGMYTE;
			
			var transform : Transform2D = new Transform2D();
			add(transform);
			
			var rendering : Rendering = new Rendering();
			rendering.view = new StalagmyteView();
			add(rendering);
			
			var distanceTrigger : DistanceTrigger = new DistanceTrigger();
			distanceTrigger.maxDistance = 650;
			distanceTrigger.target = Scene.current.getTag("Camera").getComponent(Transform2D);
			add(distanceTrigger);
			
			add(new StalgmyteControl());
		}

	}
}
