package com.pixodrome.theBat.scenes.game {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.theBat.entitys.score.ScoreControl;
	import com.pixodrome.theBat.entitys.stalagmytes.StalagmyteSpawnerControl;
	/**
	 * @author Thomas
	 */
	public class GameControl extends Component {
		
		private var mBatVelocity : Velocity;
		private var mScore : ScoreControl;
		private var mStalagmyte : StalagmyteSpawnerControl;
		private var mDifficulty : Number = 0;
		
		public var batBaseVelocity : Number = 150;
		
		override public function onCreate() : void {
			mBatVelocity = Scene.current.getTag("Bat").getComponent(Velocity);
			mScore = Scene.current.getTag("Score").getComponent(ScoreControl);
			mStalagmyte = Scene.current.getTag("StalagmyteSpawner").getComponent(StalagmyteSpawnerControl);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			mDifficulty = Math.pow(mScore.score, 0.7);
			mBatVelocity.velocityX = batBaseVelocity + mDifficulty ;
			mStalagmyte.difficulty = mDifficulty;
		}
	}
}
