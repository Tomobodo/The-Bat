package com.pixodrome.pdk.component.basicPhysic {
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class Gravity extends Component{
		
		public var gravity : Number = 3;
		
		private var mVelocity:Velocity;
		
		override public function onCreate() : void {
			mVelocity = entity.getComponent(Velocity);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			mVelocity.velocityY += gravity;
		}
		
	}
}
