package com.pixodrome.theBat.entitys.EnergieBar {
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.theBat.entitys.bat.Energie;
	import starling.display.Quad;
	import starling.display.DisplayObject;

	import com.pixodrome.pdk.display.IRenderable;

	/**
	 * @author Thomas
	 */
	public class EnergieBarView implements IRenderable{
		
		private var mBar : Quad;
		private var mEnergie : Energie;
		private var mTransform : Transform2D;
		private var mEntity : Entity;
		
		public function EnergieBarView() {
			mBar = new Quad(800, 20);
			mEnergie = Scene.current.getTag("Bat").getComponent(Energie);
		}

		public function onMessage(message : String, params : Object) : void {
		}

		public function getView() : DisplayObject {
			return mBar;
		}

		public function onUpdate(deltaTime : Number) : void {
			mTransform.scaleX = mEnergie.energie / mEnergie.maxEnergie;
		}
		
		public function setEntity(entity : Entity) : void {
			mEntity = entity;
			mTransform = mEntity.getComponent(Transform2D);
		}
	}
}
