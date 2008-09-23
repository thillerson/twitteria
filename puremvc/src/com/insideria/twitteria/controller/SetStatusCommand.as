package com.insideria.twitteria.controller {
	
	import com.insideria.twitteria.model.StatusProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class SetStatusCommand extends SimpleCommand {
		
		override public function execute(note:INotification):void {
			var statusProxy:StatusProxy = facade.retrieveProxy(StatusProxy.NAME) as StatusProxy;
			statusProxy.setStatus(note.getBody() as String);
		}
		
	}
}