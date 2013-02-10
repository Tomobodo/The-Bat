package com.pixodrome.theBat.entitys.energieBar {
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
			mBar = new Quad(800, 20, 0xffff00);
			mEnergie = Scene.current.getTag("Bat").getComponent(Energie);
		}

		public function onMessage(message : String, params : Object) : void {
		}

		public function getView() : DisplayObject {
			return mBar;
		}

		public function onUpdate(deltaTime : Number) : void {
			var percent : Number = mEnergie.energie / mEnergie.maxEnergie;
			mTransform.scaleX = percent;
			
			var r:Number = 0xff << 16;
			var v:Number = (0xff * percent) << 8;
			var b:Number = 0x00;
			
			mBar.color = r | v | b;
		}
		
		public function setEntity(entity : Entity) : void {
			mEntity = entity;
			mTransform = mEntity.getComponent(Transform2D);
			
			mTransform.y = 460;
		}
	}
}
