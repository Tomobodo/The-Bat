package com.pixodrome.theBat.scene {
	import com.pixodrome.theBat.entitys.bat.Bat;
	import com.pixodrome.pdk.application.Scene;
	import com.pixodrome.pdk.component.display.Rendering;
	import com.pixodrome.pdk.component.display.Transform2D;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.entitys.bat.BatView;
	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene{
		
		function GameScene() : void {
			
			super();
			
			add(new Bat());			
		}
		
	}
}
