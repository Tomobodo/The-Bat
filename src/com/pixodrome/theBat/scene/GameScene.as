package com.pixodrome.theBat.scene {
	import com.pixodrome.pdk.component.Transform2D;
	import com.pixodrome.pdk.Scene;
	import com.pixodrome.pdk.component.StarlingRenderer;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.entity.Renderer;
	import com.pixodrome.theBat.DrawRect;
	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene{
		
		function GameScene() : void {
			
			super();
			

			var tost : Entity = new Entity().add(new Transform2D()).add(new DrawRect());
			
			add(new Renderer().add(new StarlingRenderer()));
			add(tost);			
		}
		
	}
}
