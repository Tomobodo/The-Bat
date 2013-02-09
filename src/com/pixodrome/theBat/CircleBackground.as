package com.pixodrome.theBat {
	import flash.display.BitmapData;
	import flash.display.Shape;

	/**
	 * @author Thomas
	 */
	public class CircleBackground extends BitmapData {
		private var circles : Vector.<Object>;
		private var shape : Shape;
		private var maxSize : uint;

		function CircleBackground(nbCircle : uint, maxSize : uint) {
			super(256, 256, true, 0);

			this.circles = new Vector.<Object>();
			this.shape = new Shape();
			this.shape.graphics.lineStyle(2, 0xffffff, 0.1);

			var nbCircle : uint = nbCircle;
			this.maxSize = maxSize;

			for (var i : uint = 0; i < nbCircle; ++i)
				drawCircle();

			this.draw(shape);
		}

		private function drawCircle() : void {
			do {
				var fit : Boolean = true;
				var x : Number = Math.random() * this.width;
				var y : Number = Math.random() * this.height;
				var radius : Number = Math.random() * this.maxSize;

				if (x + radius > this.width)
					fit = false;
				if (x - radius < 0)
					fit = false;
				if (y + radius > this.height)
					fit = false;
				if (y - radius < 0)
					fit = false;
			} while(!fit);

			this.shape.graphics.beginFill(0xffffff, 0.02);
			this.shape.graphics.drawCircle(x, y, radius);
			this.shape.graphics.endFill();
		}
	}
}
