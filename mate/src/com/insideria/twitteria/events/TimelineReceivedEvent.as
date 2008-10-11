package com.insideria.twitteria.events {
	
	import flash.events.Event;

	public class TimelineReceivedEvent extends Event {
		
		public static const TIMELINE_RECEIVED:String = "timelineReceived";
		
		public var tweets:Array;
		
		public function TimelineReceivedEvent(tweets:Array) {
			super(TIMELINE_RECEIVED, true, false);
			this.tweets = tweets;
		}
		
	}
}