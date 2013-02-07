package com.pixodrome.theBat.entitys.bat {
	import starling.core.Starling;
	import com.pixodrome.theBat.assets.Assets;
	import starling.display.MovieClip;
	import starling.display.DisplayObject;
	import com.pixodrome.pdk.display.IRenderable;
	/**
	 * @author Thomas
	 */
	public class BatView implements IRenderable {
		
		private var mView : MovieClip;
		
		function BatView(){
			mView = new MovieClip(Assets.getAtlas().getTextures("batFly_"), 12);
			mView.addFrame(Assets.getAtlas().getTexture("batFly_2"));
			
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
