package com.pixodrome.pdk.display {
	import com.pixodrome.pdk.entity.Entity;
	import starling.display.DisplayObject;
	/**
	 * @author Thomas
	 */
	public interface IRenderable {
		
		function setEntity(entity:Entity):void;
		
		function onMessage(message:String, params:Object):void;
		
		function onUpdate(deltaTime:Number):void;
		
		function getView() : DisplayObject;
	}
}
