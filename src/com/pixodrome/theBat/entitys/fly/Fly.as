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
			
			var tran : Transform2D = new Transform2D();
			tran.x = 1000;
			add(tran);
			
			var rendering:Rendering = new Rendering();
			rendering.view = new FlyView();
			add(rendering);
		}
	}
}
