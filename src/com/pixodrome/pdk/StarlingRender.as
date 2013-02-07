package com.pixodrome.pdk {
	import starling.display.Sprite;

	/**
	 * @author Thomas
	 */
	public class StarlingRender extends Sprite {
		
		public static const gui : Sprite = new Sprite();
		public static const scene : Sprite = new Sprite();
		
		public function StarlingRender() {
			
			addChild(scene);
			addChild(gui);
			
		}
	}
}
