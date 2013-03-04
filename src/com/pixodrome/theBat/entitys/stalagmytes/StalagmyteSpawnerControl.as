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
		
		public var eloignement : Number = 100;
		public var spawnMinInterval : Number = 3000;
		public var spawnMaxInterval : Number = 3000;
			
		override public function onCreate() : void {
			mTimer = new Timer(2000);
			mTimer.addEventListener(TimerEvent.TIMER, onTimer);
			mTimer.start();
			
			mTransform = entity.getComponent(Transform2D);
		}

		private function onTimer(event : TimerEvent) : void {
			var posy : Number = Math.random() * 100;
			mTransform.y = posy;
			emit(EntitySpawner.MESSAGE_SPAWN, Stalagmyte);
			mTransform.y = -posy;
			emit(EntitySpawner.MESSAGE_SPAWN, Stalagmyte);
			//mTimer.delay = Math.random() * (spawnMaxInterval - spawnMinInterval) + spawnMinInterval;
		}
	}
}
