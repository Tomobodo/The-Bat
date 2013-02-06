package com.pixodrome.pdk.component {
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;

	import com.pixodrome.pdk.Application;

	/**
	 * @author Thomas
	 */
	public class StarlingRenderer extends Component {
		private var mStarling : Starling;
		public var scene : Sprite;
		public var gui : Sprite;

		override public function onCreate() : void {
			scene = new Sprite();
			gui = new Sprite();

			mStarling = new Starling(Sprite, Application.appStage);
			mStarling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}

		private function onRootCreated(event : Event) : void {
			var root : Sprite = mStarling.root as Sprite;
			root.addChild(scene);
			root.addChild(gui);

			mStarling.start();
		}
	}
}
