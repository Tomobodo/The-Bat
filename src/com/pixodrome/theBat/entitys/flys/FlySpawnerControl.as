package com.pixodrome.theBat.entitys.flys {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.EntitySpawner;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Thomas
	 */
	public class FlySpawnerControl extends Component {
		
		private var mTimer : Timer;
			
		override public function onCreate() : void {
			mTimer = new Timer(1);
			mTimer.addEventListener(TimerEvent.TIMER, onTimer);
			mTimer.start();
		}

		private function onTimer(event : TimerEvent) : void {
			emit(EntitySpawner.MESSAGE_SPAWN, Fly);
			mTimer.delay = Math.random()* 1000 + 1000;
		}

	}
}
