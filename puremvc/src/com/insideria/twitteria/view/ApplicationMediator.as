package com.insideria.twitteria.view
{
    import com.insideria.twitteria.ApplicationFacade;
    
    import org.puremvc.as3.interfaces.*;
    import org.puremvc.as3.patterns.mediator.Mediator;
	 
    public class ApplicationMediator extends Mediator implements IMediator {

        public static const NAME:String = "ApplicationMediator";
        
		public static const LOGIN_VIEW:int	= 0;
		public static const MAIN_VIEW:int	= 1;
		
        /**
         * The ApplicationMediator is responsible for interpereting
         * events from and then acting on the root application
         */        
        public function ApplicationMediator(viewComponent:twitteria_puremvc) {
            super(NAME, viewComponent);
        }

        /**
         * A framework method that gives the mediator a chance to list
         * which notes it cares to listen to
         */
        override public function listNotificationInterests():Array {
            return [
				ApplicationFacade.VIEW_TIMELINE
			];
        }


        /**
         * A framework method that is called when any notification this 
         * mediator cares about is sent through the system
         */
        override public function handleNotification( note:INotification ):void {
            switch (note.getName()) {
				case ApplicationFacade.VIEW_TIMELINE:
					app.mainViewStack.selectedIndex = MAIN_VIEW;
				break;
            }
        }

        /**
         * Helper method to get a hold of the view
         */
        protected function get app():twitteria_puremvc {
            return viewComponent as twitteria_puremvc
        }
    }
}