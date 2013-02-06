package com.pixodrome.pdk.component {
	/**
	 * @author Thomas
	 */
	public class Transform2D extends Component{
		
		public var x:Number;
		public var y:Number;
		public var rotation:Number;
		
		override public function onCreate() : void {
			x = 0;
			y = 0;
			rotation = 0;
		}
	}
}
