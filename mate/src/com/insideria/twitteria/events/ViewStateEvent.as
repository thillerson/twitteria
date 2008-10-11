package com.insideria.twitteria.events {
	
	import flash.events.Event;

	public class ViewStateEvent extends Event {
		
		public static const SHOW_MAIN_VIEW:String = "showMainView";
		
		public function ViewStateEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
	}
}