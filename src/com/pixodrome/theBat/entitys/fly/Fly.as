package com.pixodrome.theBat.entitys.fly {
	import starling.errors.AbstractClassError;

	import com.pixodrome.pdk.component.Trigger.DistanceTrigger;
	import com.pixodrome.pdk.component.basicPhysic.Friction;
	import com.pixodrome.pdk.component.basicPhysic.Gravity;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.display.d2.Rendering;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.components.Flying;
	import com.pixodrome.theBat.entitys.bat.Eat;
	import com.pixodrome.theBat.entitys.bat.YControl;

	/**
	 * @author Thomas
	 */
	public class Fly extends Entity {
		public function Fly() {
			super();
			
			tag = "Fly";
			
			var transform : Transform2D = new Transform2D();
			transform.scaleX = 0.5;
			transform.scaleY = 0.5;
			transform.x = 1000;
			
			add(transform);
			
			add( new Velocity());
			
			var friction : Friction = new Friction();
			friction.frictionCoef = 0.98;
			add(friction);
			
			add(new Gravity());
			
			add(new YControl());
			
			var flying : Flying = new Flying();
			flying.flyVerticalStrenght = -100;
			flying.flyHorizontalStrength = 10;
			add(flying);
			
			var distanceTrigger : DistanceTrigger = new DistanceTrigger();
			distanceTrigger.maxDistance = 500;
			distanceTrigger.target = Scene.current.getTag("Camera").getComponent(Transform2D);
			add(distanceTrigger);
			
			add(new FlyControl());
			
			var rendering:Rendering = new Rendering();
			rendering.view = new FlyView();
			add(rendering);
		}
	}
}
