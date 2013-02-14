package com.pixodrome.theBat.scenes.game {
	import com.pixodrome.pdk.input.Inputs;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.display.Quad;
	import starling.display.Sprite;

	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.display.StarlingRender;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.entitys.Cam;
	import com.pixodrome.theBat.entitys.bat.Bat;
	import com.pixodrome.theBat.entitys.energieBar.EnergieBar;
	import com.pixodrome.theBat.entitys.flys.FlySpawner;
	import com.pixodrome.theBat.entitys.score.Score;
	import com.pixodrome.theBat.entitys.stalagmytes.StalagmyteSpawner;

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
			
			add(new StalagmyteSpawner());
			
			add(new Score());
			
			var gameControl:Entity = new Entity();
			gameControl.add(new GameControl());
			add(gameControl);
			
			CONFIG::Touch{
				StarlingRender.scene.stage.addEventListener(TouchEvent.TOUCH, onTouch);
			}
		}

		private function onTouch(event : TouchEvent) : void {
			var touch : Touch = event.getTouch(StarlingRender.scene.stage, TouchPhase.BEGAN);
			if(touch)
				Inputs.mouseClicked.dispatch();
		}
	}
}
