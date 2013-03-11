package com.pixodrome.theBat.scenes.title {
	import starling.core.Starling;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	import com.greensock.TweenLite;
	import com.greensock.plugins.SoundTransformPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.display.d2.Camera;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.sound.BGMEmitter;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.display.ScrollingImage;
	import com.pixodrome.pdk.display.StarlingRender;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.assets.Assets;
	import com.pixodrome.theBat.scenes.game.GameScene;

	import flash.display.Bitmap;
	import flash.media.SoundChannel;
	import flash.text.TextField;
	
	TweenPlugin.activate([SoundTransformPlugin]);
	
	/**
	 * @author Thomas
	 */
	public class TitleScreen extends Scene{
		
		[Embed(source="../../../../../../media/sound/Title Screen.mp3")]
		private var TitleBGM : Class;
		
		[Embed(source="../../../../../../media/graph/typoTitre.png")]
		private var TypoTitre : Class;
		private var bgm : BGMEmitter;
		private var texto : TextField;
		
		function TitleScreen() : void{
			super();
			
			var blackBars : Sprite = new Sprite();
			StarlingRender.gui.addChild(blackBars);
			var quad1 : Quad = new Quad(800, 25,0x000000);
			var quad2 : Quad = new Quad(800, 25,0x000000);
			quad2.y = 455;
			blackBars.addChild(quad1);
			blackBars.addChild(quad2);
			
			var titreBMP : Bitmap = new TypoTitre();
			var titreTexture : Texture = Texture.fromBitmap(titreBMP);
			var titre : Image = new Image(titreTexture);
			
			StarlingRender.gui.addChild(titre);
			
			titre.x = (StarlingRender.gui.stage.stageWidth - titre.width) / 2;
			titre.y = (StarlingRender.gui.stage.stageHeight - titre.height) / 2;
			
			var camera : Camera = new Camera();
			camera.addBckgound(new ScrollingImage(Assets.ArrierePlanTexture, 800, 480, 0.2));
			camera.addBckgound(new ScrollingImage(Assets.SecondPlanTexture, 800, 480, 0.6));
			
			var velocity : Velocity = new Velocity();
			velocity.velocityX = 200;
			
			bgm = new BGMEmitter();
			bgm.sound = new TitleBGM();
			bgm.loop = int.MAX_VALUE;
			
			var background : Entity = new Entity();
			background.add(new Transform2D());
			background.add(velocity);
			background.add(camera);
			background.add(bgm);
			add(background);
			
			StarlingRender.scene.stage.addEventListener(TouchEvent.TOUCH, onTouch);
			
			initStartText();
		}

		private function initStartText() : void {
			texto = new TextField();
			
			var format : TextFormat = new TextFormat();
			
			with(format){
				color = 0xffffff;
				size = 24;
				font = "Arial";
			}
			
			with(texto){
				defaultTextFormat = format;
				selectable = false;
				text = "Click anywhere to start.";
				autoSize = TextFieldAutoSize.LEFT;
			}
			
			texto.x = (800 - texto.width) / 2;
			texto.y = 380;
			
			Starling.current.nativeStage.addChild(texto);
		}

		private function onTouch(event : TouchEvent) : void {
			var touch : Touch = event.getTouch(StarlingRender.scene.stage, TouchPhase.BEGAN);
			if(touch){
				StarlingRender.scene.stage.removeEventListener(TouchEvent.TOUCH, onTouch);
			
				TweenLite.to(StarlingRender.instance, 1, {alpha:0, onComplete:onTweenEnded});
				var snd : SoundChannel = this.bgm.soundChanel;
				TweenLite.to(snd, 1, {soundTransform:{volume:0, pan:0.5}});
				TweenLite.to(texto, 1, {alpha:0});
			}
		}
		
		private function onTweenEnded():void {
			while(StarlingRender.gui.numChildren > 0)
					StarlingRender.gui.removeChildAt(0);
			application.gotoScene(new GameScene());
			Starling.current.nativeStage.removeChild(texto);
		}
		
	}
}
