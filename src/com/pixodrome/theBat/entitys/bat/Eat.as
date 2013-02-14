package com.pixodrome.theBat.entitys.bat {
	import com.greensock.plugins.EndArrayPlugin;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.Utils;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;

	/**
	 * @author Thomas
	 */
	public class Eat extends Component {
		private var mTransform : Transform2D;
		private var mEatTransform : Transform2D;
		private var mVelocity : Velocity;
		
		public var radius : Number = 20;
		public var offsetX : Number = 0;
		public var offsetY : Number = 0;
		
		public static const MESSAGE_EATEN : String = "eaten";
		public static const MESSAGE_EAT:String = "eat";

		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mVelocity = entity.getComponent(Velocity);
			mEatTransform = new Transform2D();
		}

		override public function onUpdate(deltaTime : Number) : void {
			mEatTransform.x = mTransform.x + offsetX;
			mEatTransform.y = mTransform.y + offsetY;

			var flys : Entity = Scene.current.getEntitys();

			while (flys) {
				if (flys.tag == "Fly") {
					var flyTransform : Transform2D = flys.getComponent(Transform2D);

					if (Utils.distance2D(flyTransform, mEatTransform) < radius) {
						emit(Eat.MESSAGE_EAT);
						emit(Energie.MESSAGE_HEAL, 20);
						flys.sendMessage(Eat.MESSAGE_EATEN, mEatTransform, this);
					}
				}

				flys = flys.next;
			}
		}
	}
}
