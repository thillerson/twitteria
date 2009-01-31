package com.insideria.twitteria.controller {
	
	import com.adobe.cairngorm.control.FrontController;
	import com.insideria.twitteria.command.*;
	import com.insideria.twitteria.event.*;
    
	public class TwitteRIAController extends FrontController {
		
		public function TwitteRIAController() {
			initialize();
		}
		
		// The Front Controller's responsibility is to match CairngormEvents to 
		// CairngormCommands. To make that work, you associate them in your implementation
		// of the controller, like here
		private function initialize():void {
			addCommand(LogInEvent.LogIn_Event, LogInCommand);
			addCommand(LoadTimelineEvent.LoadTimeline_Event, LoadTimelineCommand);
			addCommand(SetStatusEvent.SetStatus_Event, SetStatusCommand);
		}
	}
}