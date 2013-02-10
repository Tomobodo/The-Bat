package com.pixodrome.theBat.components {
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class Flying extends Component {
		
		private var mVelocity:Velocity;
		
		public var flyVerticalStrenght : Number = -50;
		public var flyHorizontalStrength : Number = 0;
		
		public static const MESSAGE_FLY : String = "fly";
		
		override public function onCreate() : void {
			mVelocity = entity.getComponent(Velocity);
		}
		
		override public function onMessage(message : String, params : Object) : void {
			if(message == MESSAGE_FLY){
				mVelocity.velocityX += flyHorizontalStrength;
				mVelocity.velocityY += flyVerticalStrenght;
			}
		}
	}
}
