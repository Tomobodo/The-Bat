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
		public function Stalagmyte() {
			super();
			
			tag = "Stalagmyte";
			
			add(new Transform2D());
			
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
