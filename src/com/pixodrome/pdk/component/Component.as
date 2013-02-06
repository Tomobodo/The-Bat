package com.pixodrome.pdk.component {
	import com.pixodrome.pdk.IDestroyable;
	import com.pixodrome.pdk.entity.Entity;
	/**
	 * @author Thomas
	 */
	public class Component implements IDestroyable {
		
		public var entity : Entity;
		
		public var next : Component;
		public var previous : Component;
		
		function Component(){
		}

		public function onCreate() : void {
		}
		
		public function onUpdate(deltaTime:Number) : void {
		}
		
		public function onMessage(message:String, params:Object):void {
		}
		
		public function destroy() : void {
		}
		
	}
}
