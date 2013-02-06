package com.pixodrome.theBat {
	import com.pixodrome.pdk.entity.Renderer;
	import starling.display.Quad;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.StarlingRenderer;
	/**
	 * @author Thomas
	 */
	public class DrawRect extends Component{
		
		var renderComp : StarlingRenderer;
		
		override public function onCreate() : void {
			renderComp = entity.scene.getTag(Renderer.TAG).getComponent(StarlingRenderer) as StarlingRenderer;
			
			
			renderComp.scene.addChild(new Quad(30, 30, 0xff0000));
		}
		
	}
}
