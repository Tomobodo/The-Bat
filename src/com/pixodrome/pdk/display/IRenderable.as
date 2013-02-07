package com.pixodrome.pdk.display {
	import starling.display.DisplayObject;
	/**
	 * @author Thomas
	 */
	public interface IRenderable {
		
		function setState(stateName : String):void;
		
		function play():void;
		
		function pause():void;
		
		function getView() : DisplayObject;
	}
}
