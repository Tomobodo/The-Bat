package com.pixodrome.theBat.entitys.stalagmytes {
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.EntitySpawner;

	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Thomas
	 */
	public class StalagmyteSpawnerControl extends Component{
		
		private var mTimer : Timer;
		private var mTransform : Transform2D;
		
		public var eloignement : Number = 200;
		public var spawnMinInterval : Number = 2000;
		public var spawnInterval : Number = 3000;
			
		override public function onCreate() : void {
			mTimer = new Timer(1);
			mTimer.addEventListener(TimerEvent.TIMER, onTimer);
			mTimer.start();
			
			mTransform = entity.getComponent(Transform2D);
		}

		private function onTimer(event : TimerEvent) : void {
			emit(EntitySpawner.MESSAGE_SPAWN, Stalagmyte);
			mTimer.delay = Math.random() * (spawnInterval - spawnMinInterval) + spawnMinInterval;
			if(mTransform.y < 0)
				mTransform.y = 260 + Math.random() * eloignement;
			else
				mTransform.y = -260 - Math.random() * eloignement;
		}
	}
}
