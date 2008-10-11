package com.insideria.twitteria.events {
	
	import flash.events.Event;

	public class SetStatusEvent extends Event {
		
		public static const SET_STATUS:String = "setStatus";
		
		public var statusText:String;
		
		public function SetStatusEvent(statusText:String) {
			super(SET_STATUS, true, false);
			this.statusText = statusText;
		}
		
	}
}