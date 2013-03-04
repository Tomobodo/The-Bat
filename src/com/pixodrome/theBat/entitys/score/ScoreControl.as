package com.pixodrome.theBat.entitys.score {
	import com.pixodrome.theBat.entitys.bat.Energie;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	/**
	 * @author Thomas
	 */
	public class ScoreControl extends Component{
		
		public var score : uint = 0;
		
		private var mBatPos : Transform2D;
		private var mBatEnergie : Energie;
		
		
		override public function onCreate() : void {
			mBatEnergie = Scene.current.getTag("Bat").getComponent(Energie);
			mBatPos = Scene.current.getTag("Bat").getComponent(Transform2D);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			if(mBatEnergie.energie > 0)
				score = mBatPos.x / 10;
		}
		
	}
}
