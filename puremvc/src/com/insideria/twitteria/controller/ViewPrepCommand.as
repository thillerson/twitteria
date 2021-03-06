package com.insideria.twitteria.controller {
	
	import com.insideria.twitteria.ApplicationFacade;
	import com.insideria.twitteria.model.*;
	import com.insideria.twitteria.view.*;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand {
		
		/**
		 * Prepping the View means instantiating mediators
		 * and giving them references to the parts of the view they
		 * mediate
		 */		
		override public function execute(note:INotification):void {
			var app:twitteria_puremvc = note.getBody() as twitteria_puremvc;
			facade.registerMediator(new ApplicationMediator(app));
			facade.registerMediator(new LoginViewMediator(app.loginView));
			facade.registerMediator(new MainViewMediator(app.mainView));
			
		}
	}
}