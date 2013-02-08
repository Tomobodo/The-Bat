package com.pixodrome.pdk.component.display.d2	
{
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.display.StarlingRender;
	
	/**
	 * @author Thomas
	 */
	public class Rendering extends Component{
		
		private var transform : Transform2D;
		private var scene : Sprite;
		private var mView : DisplayObject;
		private var mAdded : Boolean;
		
		public var view : IRenderable;
		
		override public function onCreate() : void {
			
			transform = entity.getComponent(Transform2D);
			scene = StarlingRender.scene;
			
			mView = view.getView();
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			if(!mAdded){
				scene.addChild(mView);
				mAdded = true;
			}
			mView.x = transform.x;
			mView.y = transform.y;
			mView.rotation = transform.rotation;
			mView.scaleX = transform.scaleX;
			mView.scaleY = transform.scaleY;
		}
		
	}
}
