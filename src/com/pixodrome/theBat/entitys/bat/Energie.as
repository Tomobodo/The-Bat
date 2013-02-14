package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.Component;

	/**
	 * @author Thomas
	 */
	public class Energie extends Component {
		
		public var maxEnergie : uint = 100;
		public var energie : Number;
		
		public static const MESSAGE_HURT:String = "hurt";
		public static const MESSAGE_HEAL:String = "heal"
		public static const MESSAGE_DEAD:String = "dead";
		
		override public function onCreate() : void {
			energie = maxEnergie;
		}
		
		override public function onMessage(message : String, params : Object) : void {
			switch(message){
				case MESSAGE_HEAL :
					add(Number(params));
					break;
				case MESSAGE_HURT :
					remove(Number(params));
					break;
			}
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			remove(deltaTime * 4);
		}

		public function remove(_energie : Number) : void {
			energie -= _energie;
			if(energie <= 0)
			{
				energie = 0;
				emit(MESSAGE_DEAD);
			}
		}
		
		public function add(_energie:Number):void{
			energie += _energie;
			if(energie > maxEnergie)
				energie = maxEnergie;
		}

	}
}
