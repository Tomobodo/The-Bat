package com.pixodrome.theBat.entitys.spawner {
	import com.pixodrome.theBat.entitys.fly.Fly;
	import com.pixodrome.pdk.component.EntitySpawner;
	import flash.events.TimerEvent;
	import com.pixodrome.pdk.component.Component;

	import flash.utils.Timer;

	/**
	 * @author Thomas
	 */
	public class FlySpawnerControl extends Component {
		
		private var mTimer : Timer;
			
		override public function onCreate() : void {
			mTimer = new Timer(1000);
			mTimer.addEventListener(TimerEvent.TIMER, onTimer);
			mTimer.start();
		}

		private function onTimer(event : TimerEvent) : void {
			emit(EntitySpawner.MESSAGE_SPAWN, Fly);
		}


	}
}
