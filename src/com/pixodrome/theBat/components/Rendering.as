package com.pixodrome.theBat.components {
	import starling.display.Sprite;

	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.Transform2D;
	import com.pixodrome.pdk.display.IRenderable;
	import com.pixodrome.pdk.display.StarlingRender;
	/**
	 * @author Thomas
	 */
	public class Rendering extends Component{
		
		private var transform : Transform2D;
		private var scene : Sprite;
		
		public var view : IRenderable;
		
		override public function onCreate() : void {
			
			transform = entity.getComponent(Transform2D) as Transform2D;
			scene = StarlingRender.scene;
			
			scene.addChild(view.getView());
		}
		
	}
}
