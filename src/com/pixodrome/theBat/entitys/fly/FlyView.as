package com.pixodrome.theBat.entitys.fly {
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
		private var mEyes : MovieClip;
		private var mEyesPositions : Array;
		private var mView : Sprite;
		
		function FlyView(){
			
			mView = new Sprite();
			
			mAnimation = new MovieClip(Assets.getAtlas().getTextures("flyFly_"), 25);
			mAnimation.addFrame(Assets.getAtlas().getTexture("flyFly_2"));
			mAnimation.addEventListener(starling.events.Event.COMPLETE, onAnimComplete);
			
			Starling.juggler.add(mAnimation);
			
			mAnimation.pivotX = mAnimation.width/2;
			mAnimation.pivotY = mAnimation.height/2;
			
			mView.addChild(mAnimation);
			
			mEyes = new MovieClip(Assets.getAtlas().getTextures("flyEye_"),1);
			
			Starling.juggler.add(mEyes);
			
			mEyes.pivotX = mEyes.width / 2;
			mEyes.pivotY = mEyes.height / 2;
			
			mEyesPositions = [-25,-20,-15,-20];
			
			mEyes.x = 10;
			mEyes.y = mEyesPositions[0];
			
			mView.addChild(mEyes);
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
