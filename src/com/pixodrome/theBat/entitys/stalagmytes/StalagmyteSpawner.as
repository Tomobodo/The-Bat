package com.pixodrome.theBat.entitys.stalagmytes {
	import com.pixodrome.pdk.component.EntitySpawner;
	import com.pixodrome.pdk.component.constraint.XDistanceConstraint;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.entity.Entity;
	/**
	 * @author Thomas
	 */
	public class StalagmyteSpawner extends Entity{
		public function StalagmyteSpawner() {
			super();
			
			tag = "StalagmyteSpawner";
			
			var transform : Transform2D = new Transform2D();
			transform.y = -300;
			add(transform);
			
			var camPos : Transform2D = Scene.current.getTag("Camera").getComponent(Transform2D);
			
			var constraint : XDistanceConstraint = new XDistanceConstraint();
			constraint.target = camPos;
			constraint.distance = 600;
			add(constraint);
			
			add(new EntitySpawner());
			
			add(new StalagmyteSpawnerControl());
		}
	}
}
