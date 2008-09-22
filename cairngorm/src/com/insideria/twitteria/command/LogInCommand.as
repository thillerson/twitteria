package com.insideria.twitteria.command {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import com.insideria.twitteria.event.LogInEvent;
	import com.insideria.twitteria.model.TwitteRIAModel;
	
	public class LogInCommand implements ICommand {
		
		private var model:TwitteRIAModel = TwitteRIAModel.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:LogInEvent = event as LogInEvent;
			model.username = evt.username;
			model.password = evt.password;
			
			model.mainViewIndex = TwitteRIAModel.MAIN_VIEW;
		}
		
	}
}