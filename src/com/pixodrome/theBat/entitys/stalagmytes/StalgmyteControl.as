package com.pixodrome.theBat.entitys.stalagmytes {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.Trigger.DistanceTrigger;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;

	/**
	 * @author Thomas
	 */
	public class StalgmyteControl extends Component {
		private var mTransform : Transform2D;
		private var mCamPos : Transform2D;

		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mCamPos = Scene.current.getTag("Camera").getComponent(Transform2D);
			if (mTransform.y > 0)
				mTransform.scaleY = -1;
		}

		override public function onMessage(message : String, params : Object) : void {
			switch(message) {
				case DistanceTrigger.MESSAGE_DISTANCE_MAX:
					if (mTransform.x < mCamPos.x)
						Scene.current.remove(entity);
					break;
			}
		}
	}
}
