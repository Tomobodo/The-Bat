package com.pixodrome.theBat.entitys.bat {
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Rendering;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.entitys.stalagmytes.Stalagmyte;

	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author Thomas
	 */
	public class HitStalagmyte extends Component {
		private var mTransform : Transform2D;
		private var mPos : Point;

		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mPos = new Point();
		}

		override public function onUpdate(deltaTime : Number) : void {
			var stalagmytes : Entity = Scene.current.getEntitys();

			mPos.x = mTransform.x;
			mPos.y = mTransform.y;

			while (stalagmytes) {
				if (stalagmytes.tag == Stalagmyte.TAG_STALGMYTE) {
					var renderComp : Rendering = stalagmytes.getComponent(Rendering);
					var hitBounds : Rectangle = renderComp.getBounds();

					if (hitBounds.containsPoint(mPos))
						emit(Energie.MESSAGE_HURT,1);
				}
				stalagmytes = stalagmytes.next;
			}
		}
	}
}
