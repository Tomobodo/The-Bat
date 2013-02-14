package com.pixodrome.theBat.entitys.energieBar {
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;

	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.entity.Entity;
	import com.pixodrome.theBat.entitys.bat.Energie;

	/**
	 * @author Thomas
	 */
	public class EnergieBarView implements IRenderable{
		
		private var mBar : Sprite;
		private var mBackgroundBar : Quad;
		private var mEnergie : Energie;
		private var mTransform : Transform2D;
		private var mEntity : Entity;
		private var mView : Sprite;
		
		public function EnergieBarView() {
			
			var barWidth : uint = 700;
			var barHeight : uint = 18;
			
			mBackgroundBar = new Quad(barWidth+4, barHeight+4, 0x000000);
			mBar = new Sprite();
			
			mBar.addChild(new Quad(barWidth, barHeight, 0x914130));
			var quad2:Quad = new Quad(barWidth, barHeight / 2, 0x783629);
			quad2.y = barHeight / 2;
			mBar.addChild(quad2);
			var quad3:Quad = new Quad(barWidth, barHeight / 6, 0x4a231c)
			quad3.y = barHeight / 6 * 5;
			mBar.addChild(quad3);
			
			mBackgroundBar.x = -mBackgroundBar.width/2;
			mBackgroundBar.y = -mBackgroundBar.height/2;
			
			mBar.x = -mBar.width/2;
			mBar.y = -mBar.height/2;
			
			mView = new Sprite();
			
			mView.addChild(mBackgroundBar);
			mView.addChild(mBar);
			
			mEnergie = Scene.current.getTag("Bat").getComponent(Energie);
		}

		public function onMessage(message : String, params : Object) : void {
		}

		public function getView() : DisplayObject {
			return mView;
		}

		public function onUpdate(deltaTime : Number) : void {
			var percent : Number = mEnergie.energie / mEnergie.maxEnergie;
			mBar.scaleX = percent;
		}
		
		public function setEntity(entity : Entity) : void {
			mEntity = entity;
			mTransform = mEntity.getComponent(Transform2D);
			
			mTransform.y = 435;
			mTransform.x = 400;
		}
	}
}
