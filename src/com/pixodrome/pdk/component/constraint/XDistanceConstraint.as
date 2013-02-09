package com.pixodrome.pdk.component.constraint {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.entity.Entity;

	/**
	 * @author Thomas
	 */
	public class XDistanceConstraint extends Component {
		
		private var mTransform : Transform2D;
		
		public var distance : Number;
		public var target : Transform2D;
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			mTransform.x = target.x + distance;
		}
		
	}
}
