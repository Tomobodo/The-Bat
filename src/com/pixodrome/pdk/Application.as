package com.pixodrome.pdk {
	import flash.utils.getTimer;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * @author Thomas
	 */
	public class Application extends Sprite{
		
		private var mCurrentTime : uint;

		protected var mCurrentScene : Scene;
		
		function Application(){
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			onCreate();
		}

		private function onEnterFrame(event : Event) : void {
			
			var time:uint = getTimer();
			var deltaTime : Number = (time - mCurrentTime) * 0.001;
			mCurrentTime = time;
			
			if(mCurrentScene)
				mCurrentScene.update(deltaTime);
		}

		protected function onCreate() : void {
		}
		
		public function gotoScene(scene:Scene):void{
			if(mCurrentScene)
				mCurrentScene.destroy();
			mCurrentScene = scene;
			mCurrentScene.onCreate();
		}
		
	}
}
