package com.pixodrome.pdk.input {
	import org.osflash.signals.Signal;
	/**
	 * @author Thomas
	 */
	public class Key {
		
		private var actionName : String;
		
		private var down : Boolean;
		
		public const pressed:Signal = new Signal();
		public const released:Signal = new Signal();
		
		function Key(actionName:String){
			this.actionName = actionName;
			this.down = false;
		}
		
		public function setDown(down:Boolean):void{
			if(down && !this.down)
				pressed.dispatch();
			else if(!down && this.down)
				released.dispatch();
			this.down = down;
		}
		
		public function isDown():Boolean{
			return this.down;
		}
	}
}
