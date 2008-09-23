package com.insideria.twitteria.controller {
	
	import com.adobe.cairngorm.control.FrontController;
	import com.insideria.twitteria.command.*;
	import com.insideria.twitteria.event.*;
    
	public class TwitteRIAController extends FrontController {
		
		public function TwitteRIAController() {
			initialize();
		}
		
		private function initialize():void {
			addCommand(LogInEvent.LogIn_Event, LogInCommand);
			addCommand(LoadTimelineEvent.LoadTimeline_Event, LoadTimelineCommand);
			addCommand(SetStatusEvent.SetStatus_Event, SetStatusCommand);
		}
	}
}