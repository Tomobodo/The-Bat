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
			velocity.velocityX = 150;
			add(velocity);
			
			add(new Gravity());
			
			add(new MouseControl());
			
			var flying : Flying = new Flying();
			flying.flyVerticalStrenght = -200;
			add(flying);
			
			var eat : Eat = new Eat();
			eat.offsetX = 10;
			eat.offsetY = -5;
			eat.radius = 30;
			eat.radiusOpen = 80;
			add(eat);
			
			add(new Energie());
			
			add(new YControl());
			
			var rendering : Rendering = new Rendering();
			new BatView();
			rendering.view = new BatView();
			add(rendering);
		}
	}
}
