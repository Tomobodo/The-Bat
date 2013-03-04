package com.pixodrome.pdk.component.display.d2 {
	import starling.display.Sprite;

	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.core.Application;
	import com.pixodrome.pdk.display.ScrollingImage;
	import com.pixodrome.pdk.display.StarlingRender;
	/**
	 * @author Thomas
	 */
	public class Camera extends Component{
		
		private var mScene : Sprite;
		private var mBackground : Sprite;
		private var mTransform : Transform2D;
		
		override public function onCreate() : void {
			
			if(!mBackground)
				mBackground = new Sprite();
			
			mScene = StarlingRender.scene;
			mTransform = entity.getComponent(Transform2D);
			
			mScene.parent.addChildAt(mBackground, 0);

			updateTransform();
		}

		private function updateTransform() : void {
			mScene.x = -mTransform.x + Application.appStage.stageWidth / 2;
			mScene.y = -mTransform.y + Application.appStage.stageHeight / 2;
			
			var nbBackground : uint = mBackground.numChildren;
			for(var i : uint = 0; i < nbBackground; ++i){
				var currentBackground : ScrollingImage = mBackground.getChildAt(i) as ScrollingImage;
				currentBackground.setOffset(mTransform.x, mTransform.y);
			}
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			updateTransform();
		}
		
		public function addBckgound(background:ScrollingImage):void{
			if(!mBackground)
				mBackground = new Sprite();
			mBackground.addChild(background);
		}
		
		override public function destroy() : void {
			super.destroy();
			
			mScene.parent.removeChild(mBackground);
		}
		
	}
}
