package com.pixodrome.theBat.scene {
	import com.pixodrome.theBat.entitys.spawner.FlySpawner;
	import com.pixodrome.pdk.core.Scene;
	import com.pixodrome.theBat.entitys.Cam;
	import com.pixodrome.theBat.entitys.bat.Bat;
	import com.pixodrome.theBat.entitys.energieBar.EnergieBar;

	/**
	 * @author Thomas
	 */
	public class GameScene extends Scene {
		function GameScene() : void {
			super();

			add(new Bat());
			
			add(new EnergieBar());

			add(new Cam());

			add(new FlySpawner());
		}
	}
}
