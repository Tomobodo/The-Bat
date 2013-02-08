package com.pixodrome.theBat.scene {
	import com.pixodrome.theBat.entitys.Cam;
	import com.pixodrome.pdk.application.Scene;
	import com.pixodrome.theBat.entitys.bat.Bat;

	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene{
		
		function GameScene() : void {
			
			super();
			
			add(new Bat());	
			add(new Cam());		
		}
		
	}
}
