package com.pixodrome.pdk.component.display.d2 {
	import com.pixodrome.pdk.component.Component;

	/**
	 * @author Thomas
	 */
	public class Transform2D extends Component {
		public var x : Number = 0;
		public var y : Number = 0;
		public var scaleX : Number = 1;
		public var scaleY : Number = 1;
		public var rotation : Number = 0;

		override public function onCreate() : void {
		}
	}
}
