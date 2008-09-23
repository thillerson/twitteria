package com.insideria.twitteria.model {
	
	import com.insideria.twitteria.ApplicationFacade;
	import com.insideria.twitteria.controller.business.TwitterDelegate;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
    public class TimelineProxy extends Proxy implements IProxy, IResponder {
    	
		public static const NAME:String = "TimelineProxy";
		
		public var currentTweets:ArrayCollection; // <TwitterStatus>

		public function TimelineProxy (data:Object = null) {
            super (NAME, data);
        }
		
		public function reload():void {
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.loadTimeline();
		}
		
		public function result(result:Object):void {
			var stati:Array = result as Array;
			currentTweets = new ArrayCollection(stati);
			sendNotification(ApplicationFacade.VIEW_TIMELINE);
			sendNotification(ApplicationFacade.TIMELINE_LOADED);
		}
		
		public function fault(fault:Object):void {
			
		}
		
	}
}