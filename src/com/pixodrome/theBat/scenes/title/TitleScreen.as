package com.pixodrome.theBat.scenes.title {
	import com.pixodrome.theBat.scenes.game.GameScene;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.display.d2.Camera;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.sound.BGMEmitter;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.display.ScrollingImage;
	import com.pixodrome.pdk.display.StarlingRender;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.assets.Assets;
	/**
	 * @author Thomas
	 */
	public class TitleScreen extends Scene{
		
		[Embed(source="../../../../../../media/sound/Title Screen.mp3")]
		private var TitleBGM : Class;
		
		function TitleScreen() : void{
			super();
			
			var blackBars : Sprite = new Sprite();
			StarlingRender.gui.addChild(blackBars);
			var quad1 : Quad = new Quad(800, 25,0x000000);
			var quad2 : Quad = new Quad(800, 25,0x000000);
			quad2.y = 455;
			blackBars.addChild(quad1);
			blackBars.addChild(quad2);
			
			var camera : Camera = new Camera();
			camera.addBckgound(new ScrollingImage(Assets.ArrierePlanTexture, 800, 480, 0.2));
			camera.addBckgound(new ScrollingImage(Assets.SecondPlanTexture, 800, 480, 0.6));
			
			var velocity : Velocity = new Velocity();
			velocity.velocityX = 200;
			
			var bgm : BGMEmitter = new BGMEmitter();
			bgm.sound = new TitleBGM();
			bgm.loop = int.MAX_VALUE;
			
			var background : Entity = new Entity();
			background.add(new Transform2D());
			background.add(velocity);
			background.add(camera);
			background.add(bgm);
			add(background);
			
			StarlingRender.scene.stage.addEventListener(TouchEvent.TOUCH, onTouch);
		}

		private function onTouch(event : TouchEvent) : void {
			var touch : Touch = event.getTouch(StarlingRender.scene.stage, TouchPhase.BEGAN);
			if(touch){
				StarlingRender.scene.stage.removeEventListener(TouchEvent.TOUCH, onTouch);
				application.gotoScene(new GameScene());
			}
		}
		
	}
}
