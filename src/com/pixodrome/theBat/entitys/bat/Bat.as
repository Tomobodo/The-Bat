package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.theBat.components.Velocity;
	import com.pixodrome.theBat.components.Gravity;
	import com.pixodrome.pdk.component.display.d2.Rendering;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;

	/**
	 * @author Thomas
	 */
	public class Bat extends Entity {
		public function Bat() {
			super();
			
			tag = "Bat";
			
			var transform:Transform2D = new Transform2D();
			transform.scaleX = 0.5;
			transform.scaleY = 0.5;
			add(transform);
			
			var velocity : Velocity = new Velocity();
			velocity.velocityX = 200;
			add(velocity);
			
			var gravity : Gravity = new Gravity();
			add(gravity);
			
			var rendering : Rendering = new Rendering();
			rendering.view = new BatView();
			add(rendering);
		}
	}
}
