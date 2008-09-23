package com.insideria.twitteria.event {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoadTimelineEvent extends CairngormEvent {
		
		public static const LoadTimeline_Event:String = "<LoadTimelineEvent>";
		
		public function LoadTimelineEvent() {
			super(LoadTimeline_Event);
		}
	}
}