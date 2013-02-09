package com.pixodrome.pdk.display {
	import starling.display.DisplayObject;
	/**
	 * @author Thomas
	 */
	public interface IRenderable {
		function onMessage(message:String, params:Object):void;
		
		function getView() : DisplayObject;
	}
}
