package com.pixodrome.theBat.entitys.stalagmytes {
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.EntitySpawner;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Thomas
	 */
	public class StalagmyteSpawnerControl extends Component {
		private var mTimer : Timer;
		private var mTransform : Transform2D;
		private var mPosSpawn : int = 1;
		private var mSpawnInterval : Number = 3000;
		public var mEloignement : Number = 170;
		public var difficulty : Number = 0;

		override public function onCreate() : void {
			mTimer = new Timer(mSpawnInterval);
			mTimer.addEventListener(TimerEvent.TIMER, onTimer);
			mTimer.start();

			mTransform = entity.getComponent(Transform2D);
		}

		private function onTimer(event : TimerEvent) : void {
			var stalagMaxY : uint = difficulty / 3;
			if (stalagMaxY > 160)
				stalagMaxY = 160;

			var posy : Number = mEloignement - Math.random() * stalagMaxY;

			mTransform.y = posy * mPosSpawn;
			emit(EntitySpawner.MESSAGE_SPAWN, Stalagmyte);
			
			mPosSpawn *= -1;

			mSpawnInterval -= 50;
			mTimer.delay = mSpawnInterval;
			if (mSpawnInterval < 200)
				mSpawnInterval = 200;
			trace(mSpawnInterval);
		}
	}
}
