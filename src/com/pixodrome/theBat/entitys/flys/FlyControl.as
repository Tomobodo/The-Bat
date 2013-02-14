package com.pixodrome.theBat.entitys.flys {
	import com.pixodrome.theBat.entitys.score.ScoreControl;
	import com.pixodrome.pdk.component.GoToPoint;
	import com.pixodrome.pdk.component.basicPhysic.Gravity;
	import com.pixodrome.pdk.component.basicPhysic.Friction;
	import com.greensock.TweenLite;
	import com.pixodrome.theBat.entitys.bat.Eat;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.component.Trigger.DistanceTrigger;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.theBat.components.Flying;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Thomas
	 */
	public class FlyControl extends Component {
		private var mTransform : Transform2D;
		private var mFlying : Flying;
		private var mVelocity : Velocity;
		private var mDirectionTimer : Timer;
		private var mDirectionChanger : Number;
		private var mEaten : Boolean;
		private var mBatVelocity : Velocity;
		
		public var dead : Boolean;

		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mFlying = entity.getComponent(Flying);
			mVelocity = entity.getComponent(Velocity);
			
			mBatVelocity = Scene.current.getTag("Bat").getComponent(Velocity);
			var score : ScoreControl = Scene.current.getTag("Score").getComponent(ScoreControl);
			mFlying.flyHorizontalStrength = score.score / 100;
			//mVelocity.velocityX = mBatVelocity.velocityX;

			mDirectionTimer = new Timer(Math.random() * 2500);
			mDirectionTimer.addEventListener(TimerEvent.TIMER, onDirectionTimer);
			mDirectionTimer.start();

			onDirectionTimer(null);
		}

		private function onDirectionTimer(event : TimerEvent) : void {
			mDirectionChanger = Math.random() * mFlying.flyVerticalStrenght * 2 - mFlying.flyVerticalStrenght;
			mDirectionTimer.delay = Math.random() * 2500;
		}

		private function flap() : void {
			emit(Flying.MESSAGE_FLY);
		}

		override public function onMessage(message : String, params : Object) : void {
			switch(message) {
				case DistanceTrigger.MESSAGE_DISTANCE_MAX:
					Scene.current.remove(entity);
					break;
				case Eat.MESSAGE_EATEN:
					if (!mEaten) {
						var target : Transform2D = Transform2D(params);
						TweenLite.to(mTransform, 0.3, {scaleX:0.1, scaleY:0.1, onComplete:this.onEaten});
						dead = true;
						mEaten = true;
						entity.remove(Friction);
						entity.remove(Flying);
						entity.remove(Gravity);
						entity.remove(Velocity);
						var goto : GoToPoint = new GoToPoint();
						goto.point = target;
						goto.speed = 3;
						entity.add(goto);
					}
					break;
			}
		}
		
		private function onEaten():void{
			Scene.current.remove(entity);
		}

		override public function onUpdate(deltaTime : Number) : void {
			if (mVelocity.velocityY + mDirectionChanger >= -mFlying.flyVerticalStrenght / 2 && mTransform.y > -180)
				flap();

			if (mTransform.y > 180)
				flap();
		}
	}
}
