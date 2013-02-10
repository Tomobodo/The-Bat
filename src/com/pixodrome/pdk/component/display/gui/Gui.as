package com.pixodrome.pdk.component.display.gui {
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.display.d2.Transform2D;
	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.display.StarlingRender;

	/**
	 * @author Thomas
	 */
	public class Gui extends Component {
		private var mGui : Sprite;
		private var mView : DisplayObject;
		private var mTransform : Transform2D;
		public var view : IRenderable;

		override public function onCreate() : void {
			mTransform = entity.getComponent(Transform2D);
			mGui = StarlingRender.gui;

			view.setEntity(entity);
			mView = view.getView();
			
			updateTransform();

			mGui.addChild(mView);
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
	}
}
