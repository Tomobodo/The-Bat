package com.pixodrome.theBat.assets {
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	import flash.display.Bitmap;

	/**
	 * @author Thomas
	 */
	public class Assets {
		[Embed(source="../../../../../media/graph/theBatSheet.png")]
		public static const SpriteSheetTexture : Class;
		[Embed(source="../../../../../media/graph/theBatSheet.xml", mimeType = "application/octet-stream")]
		public static const SpriteSheetXML : Class;
		private static var textureAtlas : TextureAtlas;

		public static function getAtlas() : TextureAtlas {
			if (!textureAtlas) {
				
				var texture : Texture = Texture.fromBitmap(Bitmap(new SpriteSheetTexture));
				var xml : XML = XML(new SpriteSheetXML());
				textureAtlas = new TextureAtlas(texture, xml);
			}
			return textureAtlas;
		}
	}
}
