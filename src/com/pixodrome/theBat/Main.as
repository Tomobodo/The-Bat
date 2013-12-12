package com.pixodrome.theBat {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Security;

	/**
	 * @author Thomas
	 */
	 [SWF(backgroundColor="#000000", frameRate="60", width="800", height="480")]
	public class Main extends Sprite {
		public static var kongregate : *;
		function Main() {
			// Pull the API path from the FlashVars
			var paramObj : Object = LoaderInfo(root.loaderInfo).parameters;

			// The API path. The "shadow" API will load if testing locally.
			var apiPath : String = paramObj.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf";

			// Allow the API access to this SWF
			Security.allowDomain(apiPath);

			// Load the API
			var request : URLRequest = new URLRequest(apiPath);
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.load(request);
			this.addChild(loader);

			// Kongregate API reference
			
		}

		function loadComplete(event : Event) : void {
			// Save Kongregate API reference
			kongregate = event.target.content;
			Security.allowDomain(kongregate.loaderInfo.url);

			// Connect to the back-end
			kongregate.services.connect();
			
			addChild(new TheBat());
		}
	}
}
