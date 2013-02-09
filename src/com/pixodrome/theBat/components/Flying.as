package com.pixodrome.theBat.components {
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class Flying extends Component {
		
		private var mVelocity:Velocity;
		
		public var flyStrenght : Number = 50;
		
		override public function onCreate() : void {
			mVelocity = entity.getComponent(Velocity);
		}
		
		override public function onMessage(message : String, params : Object) : void {
			if(message == "Fly"){
				mVelocity.velocityY -= flyStrenght;
			}
		}
	}
}
