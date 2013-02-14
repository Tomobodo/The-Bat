package com.pixodrome.theBat.entitys.bat {
	import starling.textures.Texture;
	import flash.events.TimerEvent;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;

	import com.greensock.TweenLite;
	import com.pixodrome.pdk.display.Color;
	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.assets.Assets;
	import com.pixodrome.theBat.components.Flying;

	import flash.utils.Timer;

	/**
	 * @author Thomas
	 */
	public class BatView implements IRenderable {
		
		private var mAnimation : MovieClip;
		private var mView : Sprite;
		private var mHead : Image;
		
		private var mTextureMouseOpen : Texture;
		private var mTextureMouseClosed : Texture;
		
		private var mEatAnimationTimer : Timer;
		
		private var mColor : Color;
		
		function BatView() {
			mAnimation = new MovieClip(Assets.getAtlas().getTextures("batFly_"), 25);
			mAnimation.addFrame(Assets.getAtlas().getTexture("batFly_2"));
			
			mTextureMouseClosed = Assets.getAtlas().getTexture("head");
			mTextureMouseOpen = Assets.getAtlas().getTexture("headScream");			
			
			mHead = new Image(mTextureMouseClosed);
			mHead.pivotX = mHead.width / 2;
			mHead.pivotY = mHead.height / 2;

			mHead.x = 20;
			mHead.y = -35;

			Starling.juggler.add(mAnimation);

			mAnimation.pivotX = mAnimation.width / 2;
			mAnimation.pivotY = mAnimation.height / 2;

			mAnimation.addEventListener(Event.COMPLETE, onAnimComplete);

			mView = new Sprite();
			
			mColor = new Color();

			mView.addChild(mAnimation);
			mView.addChild(mHead);
		}

		private function onAnimComplete(event : Event) : void {
			mAnimation.stop();
		}

		public function onUpdate(deltaTime : Number) : void {
			var i : uint = mAnimation.currentFrame;
			if (i == 3)
				i = 1;

			mHead.y = -35 + 4 * i;
			mHead.x = 20;
			
			mAnimation.color = mColor.getColor();
			mHead.color = mColor.getColor();
		}

		public function getView() : DisplayObject {
			return mView;
		}

		public function onMessage(message : String, params : Object) : void {
			switch(message) {
				case Flying.MESSAGE_FLY:
					wingFlap();
					break;
				case Energie.MESSAGE_HURT:
					onHurted();
					break;
				case Eat.MESSAGE_OPEN_MOUTH:
					openMouth();
					break;
				case Eat.MESSAGE_CLOSE_MOUTH:
					closeMouth();
					break;
			}
		}
		
		private function closeMouth():void{
			mHead.texture = mTextureMouseClosed;
		}

		private function openMouth() : void {
			mHead.texture = mTextureMouseOpen;
		}

		private function wingFlap() : void {
			if (mAnimation.currentFrame == 0) {
				mAnimation.currentFrame = 1;
				mAnimation.play();
			}
		}
		
		private function onHurted() : void {
			mColor.v = 0x66;
			mColor.b = 0x66;
			
			TweenLite.to(mColor,0.5,{v:0xff, b:0xff});
		}

		public function setEntity(entity : Entity) : void {
		}
	}
}
