package com.pixodrome.theBat.entitys.fly {
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.theBat.components.Flying;

	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Thomas
	 */
	public class FlyAI extends Component{
		
		private var mTransform : Transform2D;
		private var mFlying : Flying;
		private var mVelocity : Velocity;
		private var mDirectionTimer : Timer;
		private var mDirectionChanger : Number;
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mFlying = entity.getComponent(Flying);
			mVelocity = entity.getComponent(Velocity);
			
			mDirectionTimer = new Timer(Math.random() * 2500);
			mDirectionTimer.addEventListener(TimerEvent.TIMER, onDirectionTimer);
			mDirectionTimer.start();
			
			onDirectionTimer(null);
		}

		private function onDirectionTimer(event : TimerEvent) : void {
			mDirectionChanger = Math.random() * mFlying.flyVerticalStrenght * 2 - mFlying.flyVerticalStrenght;
			mDirectionTimer.delay = Math.random() * 2500;
		}
		
		private function flap():void{
			emit(Flying.MESSAGE_FLY);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			
			if(mVelocity.velocityY + mDirectionChanger >= -mFlying.flyVerticalStrenght/2 && mTransform.y > -180)			
				flap();
			
			if(mTransform.y > 180)
				flap();
		}
		
	}
}
