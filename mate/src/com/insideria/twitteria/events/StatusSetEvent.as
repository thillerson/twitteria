package com.insideria.twitteria.events {
	
	import flash.events.Event;

	public class StatusSetEvent extends Event {
		
		public static const STATUS_SET:String = "statusSet";
		
		public function StatusSetEvent() {
			super(STATUS_SET, true, false);
		}
		
	}
}