package com.insideria.twitteria.view
{
    import org.puremvc.as3.interfaces.*;
    import org.puremvc.as3.patterns.mediator.Mediator;
	 
    public class ApplicationMediator extends Mediator implements IMediator {

        public static const NAME:String = "ApplicationMediator";
        
		public static const LOGIN_VIEW:int	= 0;
		public static const MAIN_VIEW:int	= 1;
        
        public function ApplicationMediator(viewComponent:twitteria_puremvc) {
            super(NAME, viewComponent);

//			facade.registerMediator( new SplashScreenMediator( app.splashScreen ) );
//			facade.registerMediator( new MainScreenMediator( app.mainScreen ) );
        }

        override public function listNotificationInterests():Array {
            return [
				ApplicationFacade.VIEW_TIMELINE
			];
        }

        override public function handleNotification( note:INotification ):void {
            switch (note.getName()) {
				case ApplicationFacade.VIEW_TIMELINE:
					app.mainViewStack.selectedIndex = MAIN_VIEW;
					break;
            }
        }

        protected function get app():twitteria_puremvc {
            return viewComponent as twitteria_puremvc
        }
    }
}