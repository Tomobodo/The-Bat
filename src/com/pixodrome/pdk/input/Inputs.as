package com.pixodrome.pdk.input {
	import org.osflash.signals.Signal;
	import flash.events.MouseEvent;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;

	/**
	 * @author Thomas
	 */
	public class Inputs {
		private static var instance : Inputs;
		private static var allowInstantiation : Boolean;
		
		private var keyMap : Object;
		private var actionMap : Object;
		private var stage : Stage;
		private var mouseDown : Boolean;
		private var rightMouseDown : Boolean;
		
		public static const mouseClicked : Signal = new Signal();
		public static const mouseReleased : Signal = new Signal();
		
		public static const rightMouseClicked : Signal = new Signal();
		public static const rightMouseReleased : Signal = new Signal();

		function Inputs(stage : Stage) {
			if (allowInstantiation) {
				this.keyMap = new Object();
				this.actionMap = new Object();
				
				this.stage = stage;
				
				this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				this.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				this.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				//this.stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onRightMouseDown);
				//this.stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onRightMouseUp);
			}
		}
		
		private function onRightMouseUp(event : MouseEvent) : void {
			this.rightMouseDown = false;
			rightMouseReleased.dispatch();
		}
		
		private function onRightMouseDown(event : MouseEvent) : void {
			this.rightMouseDown = true;
			rightMouseClicked.dispatch();
		}

		private function onMouseUp(event : MouseEvent) : void {
			this.mouseDown = false;
			mouseReleased.dispatch();
		}

		private function onMouseDown(event : MouseEvent) : void {
			this.mouseDown = true;
			mouseClicked.dispatch();
		}

		private function onKeyUp(event : KeyboardEvent) : void {
			var keyCode:uint = event.keyCode;
			var key:Key = this.keyMap[keyCode];
			if(key)
				key.setDown(false);
		}
		
		private function onKeyDown(event : KeyboardEvent) : void {
			var keyCode:uint = event.keyCode;
			var key:Key = this.keyMap[keyCode];
			if(key)
				key.setDown(true);
		}

		public static function init(stage : Stage) : Inputs {
			if (!instance) {
				allowInstantiation = true;
				instance = new Inputs(stage);
				allowInstantiation = false;
			}
			return instance;
		}
		
		public static function getI():Inputs{
			return instance;
		}
		
		public function setKey(keyCode : uint, actionName : String) : void {
			var key : Key = new Key(actionName);
			this.keyMap[keyCode] = key;
			this.actionMap[actionName] = key;
		}
		
		public function getKey(actionName : String):Key{
			return this.actionMap[actionName];
		}
		
		public function triggered(actionName:String):Boolean{
			var key:Key = this.actionMap[actionName];
			if(key)
				return key.isDown();
			return false;
		}
	}
}
