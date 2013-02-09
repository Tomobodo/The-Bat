package com.pixodrome.theBat.entitys.bat {
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;

	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.theBat.assets.Assets;
	/**
	 * @author Thomas
	 */
	public class BatView implements IRenderable {
		
		private var mAnimation : MovieClip;
		private var mView : Sprite;
		private var mHead : Image;
		
		function BatView(){
			mAnimation = new MovieClip(Assets.getAtlas().getTextures("batFly_"), 12);
			mAnimation.addFrame(Assets.getAtlas().getTexture("batFly_2"));
			
			mHead = new Image(Assets.getAtlas().getTexture("head"));
			mHead.pivotX = mHead.width / 2;
			mHead.pivotY = mHead.height / 2;
			
			mHead.y = -35;
			mHead.x = 20;
			
			Starling.juggler.add(mAnimation);
			
			mAnimation.pivotX = mAnimation.width/2;
			mAnimation.pivotY = mAnimation.height/2;

			mAnimation.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			mView = new Sprite();
			
			mView.addChild(mAnimation);
			mView.addChild(mHead);
		}

		private function onEnterFrame(event : Event) : void {
			var i :uint = mAnimation.currentFrame;
			if(i == 3)
				i = 1;			
				
			mHead.y = -35 + 4 * i;
			mHead.x = 20;
		}
		
		public function setState(stateName : String) : void {
		}

		public function play() : void {
		}

		public function pause() : void {
		}

		public function getView() : DisplayObject {
			return mView;
		}
	}
}
