package com.pixodrome.theBat.entitys.fly {
	import com.pixodrome.pdk.component.display.d2.Rendering;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;

	/**
	 * @author Thomas
	 */
	public class Fly extends Entity {
		public function Fly() {
			super();
			
			add(new Transform2D());
			
			var rendering:Rendering = new Rendering();
			rendering.view = new FlyView();
			add(rendering);
		}
	}
}
