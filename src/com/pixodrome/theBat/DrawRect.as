package com.pixodrome.theBat {
	import com.pixodrome.pdk.component.Transform2D;
	import com.pixodrome.pdk.entity.Renderer;
	import starling.display.Quad;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.StarlingRenderer;
	/**
	 * @author Thomas
	 */
	public class DrawRect extends Component{
		
		private var renderComp : StarlingRenderer;
		private var pos : Transform2D;
		private var quad : Quad;
		
		override public function onCreate() : void {
			renderComp = entity.scene.getTag(Renderer.TAG).getComponent(StarlingRenderer) as StarlingRenderer;
			pos = entity.getComponent(Transform2D) as Transform2D;
			
			quad = new Quad(30,30,0xff00ff);
			quad.pivotX = 15;
			quad.pivotY = 15;
			
			renderComp.scene.addChild(quad);
		}
		
		override public function onUpdate(deltaTime : Number) : void {
			quad.x = pos.x;
			quad.y = pos.y;
			quad.rotation = pos.rotation;
			quad.scaleX = pos.scaleX;
			quad.scaleY = pos.scaleY;
		}
		
	}
}
