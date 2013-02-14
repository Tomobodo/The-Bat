package com.pixodrome.theBat.entitys.flys {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;

	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.assets.Assets;
	import com.pixodrome.theBat.components.Flying;

	/**
	 * @author Thomas
	 */
	public class FlyView implements IRenderable {
		
		private var mAnimation : MovieClip;
		private var mEyes : Image;
		private var mEyesPositions : Array;
		private var mView : Sprite;
		private var mEyeTimer : Timer;
		
		function FlyView(){
			
			mView = new Sprite();
			
			mAnimation = new MovieClip(Assets.getAtlas().getTextures("flyFly_"), 25);
			mAnimation.addFrame(Assets.getAtlas().getTexture("flyFly_2"));
			mAnimation.addEventListener(starling.events.Event.COMPLETE, onAnimComplete);
			
			Starling.juggler.add(mAnimation);
			
			mAnimation.pivotX = mAnimation.width/2;
			mAnimation.pivotY = mAnimation.height/2;
			
			mEyeTimer = new Timer(1000);
			mEyeTimer.addEventListener(TimerEvent.TIMER, onEyeTimer);
			mEyeTimer.start();
			
			mView.addChild(mAnimation);
			
			mEyes = new Image(Assets.getAtlas().getTexture("flyEye_1"));
			
			mEyes.pivotX = mEyes.width / 2;
			mEyes.pivotY = mEyes.height / 2;
			
			mEyesPositions = [-25,-20,-15,-20];
			
			mEyes.x = 10;
			mEyes.y = mEyesPositions[0];
			
			mView.addChild(mEyes);
		}

		private function onEyeTimer(event : TimerEvent) : void {
			var img : uint = Math.random() * 3 + 1;
			mEyes.texture = Assets.getAtlas().getTexture("flyEye_" + img);
			mEyeTimer.delay = Math.random() * 3000;
		}
		
		private function onAnimComplete(event : Event) : void {
			mAnimation.stop();
		}
		
		public function getView() : DisplayObject {
			return mView;
		}

		public function onMessage(message : String, params : Object) : void {
			switch(message){
				case Flying.MESSAGE_FLY:
					wingFlap();
					break;
			}
		}
		
		private function wingFlap() : void {
			if (mAnimation.currentFrame == 0) {
				mAnimation.currentFrame = 1;
				mAnimation.play();
			}
		}

		public function setEntity(entity : Entity) : void {
		}

		public function onUpdate(deltaTime : Number) : void {
			mEyes.y = mEyesPositions[mAnimation.currentFrame];
		}
	}
}
