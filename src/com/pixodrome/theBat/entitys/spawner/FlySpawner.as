package com.pixodrome.theBat.entitys.spawner {
	import com.pixodrome.pdk.component.EntitySpawner;
	import com.pixodrome.pdk.component.constraint.XDistanceConstraint;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;

	/**
	 * @author Thomas
	 */
	public class FlySpawner extends Entity {
		public function FlySpawner() {
			super();
			
			tag = "FlySpawner";
			
			add(new Transform2D());
			
			var camPos : Transform2D = Scene.current.getTag("Camera").getComponent(Transform2D);
			
			var constraint : XDistanceConstraint = new XDistanceConstraint();
			constraint.target = camPos;
			constraint.distance = 400;
			add(constraint);
			
			add(new EntitySpawner());
			
			add(new FlySpawnerControl());
		}
	}
}