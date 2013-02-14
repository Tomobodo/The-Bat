package com.pixodrome.pdk {
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	/**
	 * @author Thomas
	 */
	public class Utils {
		
		public static function distance2D(transform1 : Transform2D, transform2 : Transform2D) : Number
		{
			var distx : Number = transform1.x - transform2.x;
			var disty : Number = transform1.y - transform2.y;
			var dist : Number = Math.sqrt(distx * distx + disty * disty);
			return dist;
		}
		
	}
}
