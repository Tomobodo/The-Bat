package com.pixodrome.theBat {
	import com.pixodrome.pdk.entity.Renderer;
	import com.pixodrome.pdk.Scene;
	import com.pixodrome.pdk.component.StarlingRenderer;
	import com.pixodrome.pdk.entity.Entity;
	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene{
		
		function GameScene() : void {
			
			super();
			

			var tost : Entity = new Entity().add(new DrawRect());
			
			add(new Renderer().add(new StarlingRenderer()));
			add(tost);			
		}
		
	}
}
