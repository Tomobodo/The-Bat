package com.pixodrome.theBat.scenes.game {
	import com.greensock.TweenLite;
	import com.pixodrome.pdk.component.sound.BGMEmitter;
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
		
		[Embed(source="../../../../../../media/sound/Game Sounds.mp3")]
		private var GameBGM : Class;
		
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
			
			var bgm : BGMEmitter = new BGMEmitter();
			bgm.sound = new GameBGM();
			bgm.loop = int.MAX_VALUE;
			
			gameControl.add(new GameControl());
			gameControl.add(bgm);
			
			add(gameControl);

			bgm.soundChanel.soundTransform.volume = 0;
			
			CONFIG::Touch{
				StarlingRender.scene.stage.addEventListener(TouchEvent.TOUCH, onTouch);
			}
			
			TweenLite.to(StarlingRender.instance, 1, {alpha:1});
			TweenLite.to(bgm.soundChanel, 1, {soundTransform:{volume:1, pan:0.5}});
		}

		private function onTouch(event : TouchEvent) : void {
			var touch : Touch = event.getTouch(StarlingRender.scene.stage, TouchPhase.BEGAN);
			if(touch)
				Inputs.mouseClicked.dispatch();
		}
		
		
	}
}
