package com.insideria.twitteria.controller {
	
	import com.insideria.twitteria.view.LoginViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand {
		
		override public function execute(note:INotification):void {
//			facade.registerProxy(new ContextProxy());
			
			var app:twitteria_puremvc = note.getBody() as twitteria_puremvc;
			facade.registerMediator(new LoginViewMediator(app.loginView));
//			facade.registerMediator(new MainViewMediator(app.mainView));
		}
	}
}