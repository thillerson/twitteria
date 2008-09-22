package com.insideria.twitteria.event {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class SetStatusEvent extends CairngormEvent {
		
		public static const SetStatus_Event:String = "<SetStatusEvent>";
		
		public var statusText:String;
		
		public function SetStatusEvent(statusText:String)  {
			super(SetStatus_Event);
			this.statusText = statusText;
		}
	}
}