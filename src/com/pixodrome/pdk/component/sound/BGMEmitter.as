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
		
		private var mSoundChanel : SoundChannel;
		
		override public function onCreate() : void {
			mSoundChanel = sound.play(0, loop);
		}
		
		override public function destroy() : void {
			super.destroy();
			mSoundChanel.stop();
		}
		
	}
}
