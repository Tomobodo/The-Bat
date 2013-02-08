package com.pixodrome.pdk.component.display.d2 {
	import com.pixodrome.pdk.application.Application;
	import com.pixodrome.pdk.display.StarlingRender;
	import starling.display.Sprite;
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class Camera extends Component{
		
		private var mScene : Sprite;
		private var mTransform : Transform2D;
		
		override public function onCreate() : void {
			mScene = StarlingRender.scene;
			mTransform = entity.getComponent(Transform2D);

			updateTransform();
		}

		private function updateTransform() : void {
			mScene.x = -mTransform.x + Application.appStage.stageWidth / 2;
			mScene.y = -mTransform.y + Application.appStage.stageHeight / 2;
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			updateTransform();
		}
		
	}
}
