package com.insideria.twitteria.controller {
	
	import com.insideria.twitteria.ApplicationFacade;
	import com.insideria.twitteria.model.*;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class LogInCommand extends SimpleCommand {
		
		override public function execute(note:INotification):void {
			var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
			var credentials:Object = note.getBody();
			
			userProxy.username = credentials['username'];
			userProxy.password = credentials['password'];
			sendNotification(ApplicationFacade.LOAD_TIMELINE);
		}
		
	}
}