package com.pixodrome.pdk.component {
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	/**
	 * @author Thomas
	 */
	public class GoToPoint extends Component {
		
		private var mTransform : Transform2D;
		
		public var point : Transform2D;
		public var speed : Number = 5;
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			
			mTransform.x += (point.x - mTransform.x) / speed;
			mTransform.y += (point.y - mTransform.y) / speed;
			
		}

	}
}
