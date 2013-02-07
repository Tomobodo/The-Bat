package com.pixodrome.theBat.scene {
	import com.pixodrome.pdk.application.Scene;
	import com.pixodrome.pdk.component.Transform2D;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.components.Rendering;
	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene{
		
		function GameScene() : void {
			
			super();
			
			var tost : Entity = new Entity().add(new Transform2D()).add(new Rendering());
			
			add(tost);			
		}
		
	}
}
