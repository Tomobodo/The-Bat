package com.pixodrome.theBat.scenes.game {
	import com.pixodrome.theBat.entitys.stalagmytes.StalagmyteSpawnerControl;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.theBat.entitys.score.ScoreControl;
	/**
	 * @author Thomas
	 */
	public class GameControl extends Component {
		
		private var mBatVelocity : Velocity;
		private var mScore : ScoreControl;
		private var mStalagmyte : StalagmyteSpawnerControl;
		private var mMinSpawnIntervalBase : uint;
		private var mMaxSpawnIntervalBase : int;
		
		public var batBaseVelocity : Number = 150;
		
		override public function onCreate() : void {
			mBatVelocity = Scene.current.getTag("Bat").getComponent(Velocity);
			mScore = Scene.current.getTag("Score").getComponent(ScoreControl);
			mStalagmyte = Scene.current.getTag("StalagmyteSpawner").getComponent(StalagmyteSpawnerControl);
			mMinSpawnIntervalBase = 3000;
			mMaxSpawnIntervalBase = 5000;
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			mBatVelocity.velocityX = mScore.score/25 + batBaseVelocity;
			mStalagmyte.spawnMinInterval = mMinSpawnIntervalBase - mScore.score;
			if(mStalagmyte.spawnMinInterval < 200)
				mStalagmyte.spawnMinInterval = 200;
			mStalagmyte.spawnMaxInterval = mMaxSpawnIntervalBase - mScore.score;
			if(mStalagmyte.spawnMinInterval < 400)
				mStalagmyte.spawnMinInterval = 400;
		}
	}
}
