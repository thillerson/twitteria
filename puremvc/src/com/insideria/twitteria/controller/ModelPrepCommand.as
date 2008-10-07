package com.insideria.twitteria.controller {
	
	import com.insideria.twitteria.model.*;
	import com.insideria.twitteria.view.*;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ModelPrepCommand extends SimpleCommand {
		
		override public function execute(note:INotification):void {
			facade.registerProxy(new TimelineProxy());
			facade.registerProxy(new StatusProxy());
			facade.registerProxy(new UserProxy());
		}
	}
}