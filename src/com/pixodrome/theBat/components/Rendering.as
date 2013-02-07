package com.pixodrome.theBat.components {
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;

	import com.pixodrome.pdk.StarlingRender;
	import com.pixodrome.pdk.component.Component;
	import com.pixodrome.pdk.component.Transform2D;
	import com.pixodrome.theBat.assets.Assets;
	/**
	 * @author Thomas
	 */
	public class Rendering extends Component{
		
		private var transform : Transform2D;
		private var scene : Sprite;
		
		override public function onCreate() : void {
			
			transform = entity.getComponent(Transform2D) as Transform2D;
			scene = StarlingRender.scene;
			
			trace(Assets.getAtlas());
			
			var movie : MovieClip = new MovieClip(Assets.getAtlas().getTextures("batFly_"), 5);
			movie.addFrame(Assets.getAtlas().getTexture("batFly_2"));
			Starling.juggler.add(movie);
			
			scene.addChild(movie);
			
		}
		
	}
}
