package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.basicPhysic.Gravity;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.display.d2.Rendering;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.components.Flying;

	/**
	 * @author Thomas
	 */
	public class Bat extends Entity {
		public function Bat() {
			super();
			
			tag = "Bat";
			
			add(new BatControl());
			
			var transform:Transform2D = new Transform2D();
			transform.scaleX = 0.5;
			transform.scaleY = 0.5;
			add(transform);
			
			var velocity : Velocity = new Velocity();
			velocity.velocityX = 200;
			add(velocity);
			
			var gravity : Gravity = new Gravity();
			gravity.gravity = 9.81;
			add(gravity);
			
			add(new MouseControl());
			
			var fly : Flying = new Flying();
			fly.flyStrenght = 200;
			add(fly);
			
			add(new Energie());
			
			add(new YControl());
			
			var rendering : Rendering = new Rendering();
			rendering.view = new BatView();
			add(rendering);
		}
	}
}
