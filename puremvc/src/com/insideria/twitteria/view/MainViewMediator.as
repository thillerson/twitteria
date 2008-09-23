package com.insideria.twitteria.view {
	
	import com.insideria.twitteria.ApplicationFacade;
	import com.insideria.twitteria.model.TimelineProxy;
	import com.insideria.twitteria.view.components.MainView;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
    public class MainViewMediator extends Mediator implements IMediator {

        public static const NAME:String = "MainViewMediator";
        
        public function MainViewMediator(viewComponent:MainView) {
            super(NAME, viewComponent);
			
			view.addEventListener(MainView.SET_STATUS, setStatus);
        }

        protected function get view():MainView {
            return viewComponent as MainView;
        }
		
        override public function listNotificationInterests():Array {
            return [
            	ApplicationFacade.TIMELINE_LOADED
            ];
        }
        
        override public function handleNotification( note:INotification ):void {
            switch (note.getName()) {
				case ApplicationFacade.TIMELINE_LOADED:
					view.currentTweets = getTimelineProxy().currentTweets;
				break;
            }
        }

		private function setStatus(event:Event):void {
			sendNotification(ApplicationFacade.SET_STATUS, view.statusText.text);
		}
		
		private function getTimelineProxy():TimelineProxy {
			return facade.retrieveProxy(TimelineProxy.NAME) as TimelineProxy;
		}
		
    }
}
