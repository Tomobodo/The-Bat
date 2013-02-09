package com.pixodrome.pdk.core {
	import starling.core.Starling;
	import starling.events.Event;
	import starling.textures.Texture;

	import com.pixodrome.pdk.display.StarlingRender;

	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;

	/**
	 * @author Thomas
	 */
	public class Application extends Sprite {
		private var mCurrentTime : uint;
		private var mStarling : Starling;
		protected var mCurrentScene : Scene;
		public static var appStage : Stage;
		public static var render : StarlingRender;

		function Application() {
			addEventListener(flash.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : flash.events.Event) : void {
			removeEventListener(flash.events.Event.ADDED_TO_STAGE, onAddedToStage);

			mStarling = new Starling(StarlingRender, stage);
			mStarling.start();

			mStarling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);

			appStage = stage;
		}

		private function onRootCreated(event : starling.events.Event) : void {
			stage.addEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame);

			onCreate();
		}

		private function onEnterFrame(event : flash.events.Event) : void {
			var time : uint = getTimer();
			var deltaTime : Number = (time - mCurrentTime) * 0.001;
			mCurrentTime = time;

			if (mCurrentScene)
				mCurrentScene.update(deltaTime);
		}

		protected function onCreate() : void {
		}

		public function gotoScene(scene : Scene) : void {
			if (mCurrentScene)
				mCurrentScene.destroy();
			mCurrentScene = scene;
		}
	}
}
