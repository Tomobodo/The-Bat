package com.pixodrome.pdk.display {
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;

	import flash.geom.Point;
	/**
	 * @author Thomas
	 */
	public class ScrollingImage extends Sprite{
		
		private var image : Image;
		private var hRatio : Number;
		private var vRatio : Number;
		private var textureWidth : uint;
		private var textureHeight : uint;
		private var parralaxCoef : Number;
		
		function ScrollingImage(texture : Texture, width : uint, height : uint, parralaxCoef : Number = 1){
			super();
			
			this.parralaxCoef = parralaxCoef;
			
			texture.repeat = true;
			
			this.image = new Image(texture);
			
			this.textureWidth = this.image.width;
			this.textureHeight = this.image.height;
			
			this.image.width = width;
			this.image.height = height;
			
			hRatio = width / textureWidth;
			vRatio = height / textureHeight;
			
			this.image.smoothing = TextureSmoothing.NONE;
			
			this.addChild(image);
		}
		
		public function setOffset(xx:Number, yy:Number):void
		{
			yy *= parralaxCoef;
			xx *= parralaxCoef;
			
			xx %= this.textureWidth;
			yy %= this.textureHeight;
			
			xx /= this.textureWidth;
			yy /= this.textureWidth;
			
			this.image.setTexCoords(0, new Point(xx, yy));
			this.image.setTexCoords(1, new Point(xx + hRatio, yy ));
			this.image.setTexCoords(2, new Point(xx, yy + vRatio));
			this.image.setTexCoords(3, new Point(xx + hRatio, yy + vRatio));
 
		}
	}
}
