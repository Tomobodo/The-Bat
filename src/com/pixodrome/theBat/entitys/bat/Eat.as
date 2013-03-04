package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.theBat.entitys.score.ScoreControl;
	import com.pixodrome.theBat.entitys.score.Score;
	import com.pixodrome.pdk.Utils;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.basicPhysic.Velocity;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.entitys.flys.FlyControl;

	/**
	 * @author Thomas
	 */
	public class Eat extends Component {
		private var mTransform : Transform2D;
		private var mEatTransform : Transform2D;
		private var mVelocity : Velocity;
		
		public var radius : Number = 20;
		public var radiusOpen : Number = 50;
		public var offsetX : Number = 0;
		public var offsetY : Number = 0;
		
		public static const MESSAGE_EATEN : String = "eaten";
		public static const MESSAGE_EAT:String = "eat";
		public static const MESSAGE_OPEN_MOUTH : String = "MESSAGE_OPEN_MOUTH";
		public static const MESSAGE_CLOSE_MOUTH : String = "MESSAGE_CLOSE_MOUTH";

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
				var aFlysIsClose : Boolean;
				if (flys.tag == "Fly") {
					var flyTransform : Transform2D = flys.getComponent(Transform2D);
					var flyControl : FlyControl = flys.getComponent(FlyControl);
					
					var dist : Number = Utils.distance2D(flyTransform, mEatTransform);

					if (dist < radius && !flyControl.dead) {
						emit(Eat.MESSAGE_EAT);
						emit(Energie.MESSAGE_HEAL, 10);
						flys.sendMessage(Eat.MESSAGE_EATEN, mEatTransform, this);
					}else if(dist < radiusOpen){
						aFlysIsClose = true;
						flys.sendMessage(Eat.MESSAGE_OPEN_MOUTH, null, this);
					}
				}
				
				if(aFlysIsClose)
					emit(Eat.MESSAGE_OPEN_MOUTH);
				else
					emit(Eat.MESSAGE_CLOSE_MOUTH);

				flys = flys.next;
			}
		}
	}
}
