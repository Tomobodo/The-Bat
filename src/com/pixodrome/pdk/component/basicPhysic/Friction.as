package com.pixodrome.pdk.component.basicPhysic {
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class Friction extends Component{
		
		private var mVelocity : Velocity;
		
		public var frictionCoef : Number = 0.7;
		
		override public function onCreate() : void {
			mVelocity = entity.getComponent(Velocity);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			mVelocity.velocityX *= frictionCoef;
			mVelocity.velocityY *= frictionCoef;
		}
		
	}
}
