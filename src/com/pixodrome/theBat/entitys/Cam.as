package com.pixodrome.theBat.entitys {
	import com.pixodrome.pdk.component.constraint.XDistanceConstraint;
	import com.pixodrome.pdk.component.display.d2.Camera;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.display.ScrollingImage;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.assets.Assets;
	/**
	 * @author Thomas
	 */
	public class Cam extends Entity{
		
		function Cam(){
			super();
			
			var distance : XDistanceConstraint = new XDistanceConstraint();
			distance.distance = 300;
			distance.target = Scene.current.getTag("Bat").getComponent(Transform2D);

			var camera : Camera = new Camera();

			camera.addBckgound(new ScrollingImage(Assets.ArrierePlanTexture, 800, 480, 0.2));
			camera.addBckgound(new ScrollingImage(Assets.SecondPlanTexture, 800, 480, 0.6));

			tag = "Camera";

			add(new Transform2D());
			add(distance);
			add(camera);
		}
		
	}
}
