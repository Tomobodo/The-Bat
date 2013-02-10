package com.pixodrome.theBat.entitys.fly {
	import com.pixodrome.theBat.components.Flying;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class FlyAI extends Component{
		
		private var mTransform : Transform2D;
		private var mFlying : Flying;
		
		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mFlying = entity.getComponent(Flying);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			if(mTransform.y > 100){
				emit(Flying.MESSAGE_FLY);
			}
		}
		
	}
}
