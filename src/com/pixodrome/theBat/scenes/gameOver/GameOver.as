package com.pixodrome.theBat.scenes.gameOver {
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;

	import com.greensock.TweenLite;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.display.d2.Camera;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.display.ScrollingImage;
	import com.pixodrome.pdk.display.StarlingRender;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.Main;
	import com.pixodrome.theBat.assets.Assets;
	import com.pixodrome.theBat.scenes.title.TitleScreen;
	/**
	 * @author Thomas
	 */
	public class GameOver extends Scene {
		private var score : uint;
		
		function GameOver(score : uint){
			super();
			
			this.score = score;
			
			CONFIG::Kongregate {
				Main.kongregate.stats.submit("HighScore",score);
			}
			
			TweenLite.to(StarlingRender.instance, 1, {alpha:1});
			
			gameOverText();
			
			var velocity : Velocity = new Velocity();
			velocity.velocityX = 200;
			
			var camera : Camera = new Camera();
			camera.addBckgound(new ScrollingImage(Assets.ArrierePlanTexture, 800, 480, 0.2));
			camera.addBckgound(new ScrollingImage(Assets.SecondPlanTexture, 800, 480, 0.6));
			
			var background : Entity = new Entity();
			background.add(new Transform2D());
			background.add(velocity);
			background.add(camera);
			add(background);
			
			StarlingRender.scene.stage.addEventListener(TouchEvent.TOUCH, onTouch);
		}

		private function gameOverText() : void {
			var textfield : TextField = new TextField(500, 300, "Game Over\nScore : " + this.score + "\n\nTap to continue.", "oogieBoogie", 42, 0xffffff);
			textfield.hAlign = "center";
			textfield.x = (800 - textfield.width) / 2;
			textfield.y = (480 - textfield.height) / 2;
			StarlingRender.gui.addChild(textfield);
		}
		
		private function onTouch(event : TouchEvent) : void {
			var touch : Touch = event.getTouch(StarlingRender.scene.stage, TouchPhase.BEGAN);
			if(touch){
				StarlingRender.scene.stage.removeEventListener(TouchEvent.TOUCH, onTouch);
				TweenLite.to(StarlingRender.instance, 1, {alpha:0, onComplete:onTweenEnded});
			}
		}
		
		private function onTweenEnded():void {
			while(StarlingRender.gui.numChildren > 0)
					StarlingRender.gui.removeChildAt(0);
			application.gotoScene(new TitleScreen());
		}
		
	}
}
