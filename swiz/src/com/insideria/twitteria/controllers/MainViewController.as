package com.insideria.twitteria.controllers {
	
	import com.insideria.twitteria.delegates.TwitterDelegate;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	public class MainViewController extends AbstractController {
		
		public static const SET_STATUS:String = "setStatus";
		
		[Autowire(bean="twitterDelegate")]
		private var twitterDelegate:TwitterDelegate;
		
		[Bindable]
		public var currentTweets:ArrayCollection;
		
		public function MainViewController() {
			Swiz.addEventListener("loginComplete", loadTweets);
		}
		
		private function loadTweets(e:Event):void {
			createCommand(twitterDelegate.loadTimeline, null, loadTimelineResult, loadTimelineFault);
		}
		
		private function loadTimelineResult(re:ResultEvent):void {
			
		}
		
		private function loadTimelineFault(fe:FaultEvent):void {
			
		}
		
	}
}