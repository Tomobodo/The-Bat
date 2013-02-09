package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.display.d2.Transform2D;

	/**
	 * @author Thomas
	 */
	public class YControl extends Component {
		
		private var mTransform : Transform2D;
		private var mVelocity : Velocity;
		
		public var maxY : int = 200;
		public var minY : int = -200;
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mVelocity = entity.getComponent(Velocity);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			
			if(mTransform.y < minY){
				mTransform.y = minY;
				if(mVelocity.velocityY < 0)
					mVelocity.velocityY = 0;
				emit("hurt", 3);
			}
			
			if(mTransform.y > maxY){
				mTransform.y = maxY;
				if(mVelocity.velocityY > 0)
					mVelocity.velocityY = 0;
				emit("hurt", 3);
			}
			
		}

	}
}
