package com.pixodrome.theBat.components {
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.Component;

	/**
	 * @author Thomas
	 */
	public class Velocity extends Component {
		
		public var velocityX : Number = 0;
		public var velocityY : Number = 0;
		
		private var mTransform : Transform2D;
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			mTransform.x += velocityX * deltaTime;
			mTransform.y += velocityY * deltaTime;
		}
		
	}
}
