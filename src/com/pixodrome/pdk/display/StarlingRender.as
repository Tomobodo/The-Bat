package com.pixodrome.pdk.display {
	import starling.display.Sprite;

	/**
	 * @author Thomas
	 */
	public class StarlingRender extends Sprite {
		
		public static const gui : Sprite = new Sprite();
		public static const scene : Sprite = new Sprite();
		public static var instance : StarlingRender;
		
		public function StarlingRender() {
			
			instance = this;
			
			addChild(scene);
			addChild(gui);
			
		}
	}
}
