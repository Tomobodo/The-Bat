package com.pixodrome.theBat.entitys.stalagmytes {
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;

	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.assets.Assets;

	/**
	 * @author Thomas
	 */
	public class StalagmyteView implements IRenderable {
		private var mView : Sprite;

		public function StalagmyteView() {
			mView = new Sprite();

			var idImg : uint = Math.random() * 5 + 1;
			var img : Image = new Image(Assets.getAtlas().getTexture("stalag_" + idImg));
			img.x = Math.random() * 75 - 150;
			img.pivotX = img.width / 2;
			mView.addChild(img);

		}

		public function setEntity(entity : Entity) : void {
		}

		public function onMessage(message : String, params : Object) : void {
		}

		public function onUpdate(deltaTime : Number) : void {
		}

		public function getView() : DisplayObject {
			return mView;
		}
	}
}
