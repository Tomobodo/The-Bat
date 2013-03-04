package com.pixodrome.theBat.assets {
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	import flash.display.Bitmap;

	/**
	 * @author Thomas
	 */
	public class Assets {
		[Embed(source="../../../../../media/graph/spriteSheet.png")]
		private static const SpriteSheetTexture : Class;
		
		[Embed(source="../../../../../media/graph/spriteSheet.xml", mimeType = "application/octet-stream")]
		private static const SpriteSheetXML : Class;
		
		[Embed(source="../../../../../media/graph/environment/arrierePlan.png")]
		private static const ArrierePlan : Class;
		public static const ArrierePlanTexture : Texture = Texture.fromBitmap(Bitmap(new ArrierePlan));
		
		[Embed(source="../../../../../media/graph/environment/secondPlan.png")]
		private static const SecondPlan : Class;
		public static const SecondPlanTexture : Texture = Texture.fromBitmap(Bitmap(new SecondPlan));
		
		[Embed(source="../../../../../media/font/OogieBoogie.ttf", fontFamily="oogieBoogie", embedAsCFF="false")]
		public static const myFont : Class;		
		
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
