package com.pixodrome.theBat.scene {
	import starling.display.Quad;
	import com.pixodrome.pdk.display.StarlingRender;

	import starling.display.Sprite;

	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.theBat.entitys.Cam;
	import com.pixodrome.theBat.entitys.bat.Bat;
	import com.pixodrome.theBat.entitys.energieBar.EnergieBar;
	import com.pixodrome.theBat.entitys.spawner.FlySpawner;

	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene {
		function GameScene() : void {
			super();

			var blackBars : Sprite = new Sprite();
			StarlingRender.gui.addChild(blackBars);
			var quad1 : Quad = new Quad(800, 25,0x000000);
			var quad2 : Quad = new Quad(800, 25,0x000000);
			quad2.y = 455;
			blackBars.addChild(quad1);
			blackBars.addChild(quad2);
			
			add(new Bat());

			add(new EnergieBar());

			add(new Cam());

			add(new FlySpawner());
		}
	}
}
