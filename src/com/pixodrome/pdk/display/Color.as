package com.pixodrome.pdk.display {
	/**
	 * @author Thomas
	 */
	public class Color {
		
		public var r : uint;
		public var v : uint;
		public var b : uint;
		
		function Color(color : uint = 0xffffff){
			setColor(color);
		}
		
		public function setColor(color : uint):void{
			r = color >> 16;
			v = color & 0x00ff00 >> 8;
			b = color & 0x0000ff;
		}
		
		public function getColor():uint{
			return r << 16 | v << 8 | b;
		}
		
	}
}
