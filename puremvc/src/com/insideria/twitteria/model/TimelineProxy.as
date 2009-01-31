package com.insideria.twitteria.model {
	
	import com.insideria.twitteria.ApplicationFacade;
	import com.insideria.twitteria.controller.business.TwitterDelegate;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
    /**
     * I've chosen to make the Proxy implement a responder and deal with 
     * service access through a delegate. This is one way of doing things, 
     * not the only way.
     */	
    public class TimelineProxy extends Proxy implements IProxy, IResponder {
    	
		public static const NAME:String = "TimelineProxy";
		
		public var currentTweets:ArrayCollection; // <TwitterStatus>

		public function TimelineProxy (data:Object = null) {
            super (NAME, data);
        }
		
		/**
		 * Interacts with the delegate to get data, 
		 * which in this case calls back to result
		 */
		public function reload():void {
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.loadTimeline();
		}
		
		/**
		 * When the delegate calls back
		 */
		public function result(result:Object):void {
			var stati:Array = result as Array;
			// hold a references to the payload 
			currentTweets = new ArrayCollection(stati);
			// this tells the MainViewMediator to show the timeline
			sendNotification(ApplicationFacade.VIEW_TIMELINE);
			// this tells the MainViewMediator that the timeline has changed
			sendNotification(ApplicationFacade.TIMELINE_LOADED);
		}
		
		public function fault(fault:Object):void {
			
		}
		
	}
}