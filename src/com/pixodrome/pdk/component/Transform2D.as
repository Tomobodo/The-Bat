package com.pixodrome.pdk.component {
	/**
	 * @author Thomas
	 */
	public class Transform2D extends Component {
		public var x : Number;
		public var y : Number;
		public var scaleX : Number;
		public var scaleY : Number;
		public var rotation : Number;

		override public function onCreate() : void {
			x = 0;
			y = 0;
			rotation = 0;
			scaleX = 1;
			scaleY = 1;
		}

		override public function onUpdate(deltaTime : Number) : void {
			x++;
			rotation += 00.001;	
		}

	}
}
