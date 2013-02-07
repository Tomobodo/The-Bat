package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.display.Rendering;
	import com.pixodrome.pdk.component.display.Transform2D;
	import com.pixodrome.pdk.entity.Entity;

	/**
	 * @author Thomas
	 */
	public class Bat extends Entity {
		public function Bat() {
			super();
			
			var transform:Transform2D = new Transform2D();
			transform.scaleX = 0.7;
			transform.scaleY = 0.7;
			add(transform);
			
			var rendering : Rendering = new Rendering();
			rendering.view = new BatView();
			add(rendering);
		}
	}
}
