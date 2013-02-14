package com.pixodrome.pdk.component.display.d2 {
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.display.StarlingRender;

	/**
	 * @author Thomas
	 */
	public class Rendering extends Component {
		private var mScene : Sprite;
		private var mView : DisplayObject;
		private var mTransform : Transform2D;
		
		public var view : IRenderable;

		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mScene = StarlingRender.scene;

			view.setEntity(entity);
			mView = view.getView();

			updateTransform();

			mScene.addChild(mView);
		}

		override public function onUpdate(deltaTime : Number) : void {
			updateTransform();
			view.onUpdate(deltaTime);
		}

		private function updateTransform() : void {
			mView.x = mTransform.x;
			mView.y = mTransform.y;
			mView.rotation = mTransform.rotation;
			mView.scaleX = mTransform.scaleX;
			mView.scaleY = mTransform.scaleY;
		}

		override public function onMessage(message : String, params : Object) : void {
			view.onMessage(message, params);
		}
		
		
		override public function destroy() : void {
			mScene.removeChild(mView);
		}
	}
}
