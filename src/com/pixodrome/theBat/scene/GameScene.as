package com.pixodrome.theBat.scene {
	import com.pixodrome.theBat.entitys.fly.Fly;
	import com.pixodrome.pdk.component.constraint.XDistanceConstraint;
	import com.pixodrome.pdk.component.display.d2.Camera;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.display.ScrollingImage;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.assets.Assets;
	import com.pixodrome.theBat.entitys.EnergieBar.EnergieBar;
	import com.pixodrome.theBat.entitys.bat.Bat;

	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene{
		
		function GameScene() : void {
			super();
			
			add(new Bat());	
			
			add(createCamera());
			
			add(new EnergieBar());
			
			add(new Fly());
		}
		
		private function createCamera():Entity{
			
			var distance : XDistanceConstraint = new XDistanceConstraint();
			distance.distance = 300;
			distance.target = getTag("Bat").getComponent(Transform2D);
			
			var camera:Camera = new Camera();
			
			camera.addBckgound(new ScrollingImage(Assets.ArrierePlanTexture, 800, 480, 0.2));
			camera.addBckgound(new ScrollingImage(Assets.SecondPlanTexture, 800, 480, 0.6));
			
			var ent : Entity = new Entity();
			ent.tag = "Camera";
			
			ent.add(new Transform2D());
			ent.add(distance);
			ent.add(camera);
			
			return ent;			
		}
		
	}
}
