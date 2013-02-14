package com.pixodrome.theBat.entitys.score {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	/**
	 * @author Thomas
	 */
	public class ScoreControl extends Component{
		
		public var score : uint = 0;
		
		private var mBatPos : Transform2D;
		
		
		override public function onCreate() : void {
			mBatPos = Scene.current.getTag("Bat").getComponent(Transform2D);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			score = mBatPos.x / 10;
		}
		
	}
}
