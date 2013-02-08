package com.pixodrome.theBat.entitys.fly {
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.MovieClip;

	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.theBat.assets.Assets;
	/**
	 * @author Thomas
	 */
	public class FlyView implements IRenderable {
		
		private var mView : MovieClip;
		
		function FlyView(){
			mView = new MovieClip(Assets.getAtlas().getTextures("flyFly_"), 17);
			mView.addFrame(Assets.getAtlas().getTexture("flyFly_2"));
			
			Starling.juggler.add(mView);
			
			mView.pivotX = mView.width/2;
			mView.pivotY = mView.height/2;
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
