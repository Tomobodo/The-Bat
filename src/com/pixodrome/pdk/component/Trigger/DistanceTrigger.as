package com.pixodrome.pdk.component.Trigger {
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class DistanceTrigger extends Component{
		
		private var mTransform : Transform2D;
		
		public var target:Transform2D;
		public var maxDistance:Number;
		
		public static const MESSAGE_DISTANCE_MAX : String = "distance_max";
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			var distX : Number = target.x - mTransform.x;
			var distY : Number = target.y - mTransform.y;
			var dist : Number = Math.sqrt(distX * distX + distY * distY); 
			
			if(dist > maxDistance)
				emit(MESSAGE_DISTANCE_MAX);
		}
		
	}
}
