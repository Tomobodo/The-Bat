package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.Component;

	/**
	 * @author Thomas
	 */
	public class Energie extends Component {
		
		public var maxEnergie : uint = 100;
		public var mEnergie : Number;
		
		override public function onCreate() : void {
			mEnergie = maxEnergie;
		}
		
		override public function onMessage(message : String, params : Object) : void {
			switch(message){
				case "eat" :
					add(Number(params));
					break;
				case "hurt" :
					remove(Number(params));
					break;
			}
		}
		
		
		override public function onUpdate(deltaTime : Number) : void {
			remove(deltaTime * 4);
		}

		private function remove(energie : Number) : void {
			mEnergie -= energie;
			if(mEnergie <= 0)
			{
				mEnergie = 0;
				emit("dead");
			}
		}
		
		private function add(energie:Number):void{
			mEnergie += energie;
			if(mEnergie > maxEnergie)
				mEnergie = maxEnergie;
		}

	}
}
