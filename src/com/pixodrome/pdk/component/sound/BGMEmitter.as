package com.pixodrome.pdk.component.sound {
	import flash.media.SoundChannel;
	import flash.media.Sound;
	import com.pixodrome.pdk.component.Component;
	/**
	 * @author Thomas
	 */
	public class BGMEmitter extends Component{
		
		public var sound : Sound;
		public var loop : int;
		
		public var soundChanel : SoundChannel;
		
		override public function onCreate() : void {
			soundChanel = sound.play(0, loop);
		}
		
		override public function destroy() : void {
			super.destroy();
			soundChanel.stop();
		}
		
	}
}
