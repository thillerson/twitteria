package com.insideria.twitteria.controllers {
	
	import com.insideria.twitteria.delegates.TwitterDelegate;
	import com.insideria.twitteria.delegates.twitter.TwitterResponder;
	import com.insideria.twitteria.model.TwitteRIAModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.events.DynamicEvent;
	
	import org.swizframework.Swiz;
	import org.swizframework.controller.AbstractController;
	
	public class MainViewController extends AbstractController implements TwitterResponder {
		
		public static const SET_STATUS:String = "setStatus";
		
		[Autowire(bean="model")]
		public var model:TwitteRIAModel;
		
		[Bindable]
		public var currentTweets:ArrayCollection;
		
		public function MainViewController() {
			Swiz.addEventListener(LoginViewController.LOGIN_COMPLETE, loginComplete);
		}
		
		public function setStatus(statusMessage:String):void {
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.setStatus(statusMessage);
		}
		
		public function loadTweets():void {
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.loadTimeline(username);
		}
		
		public function get username():String {
			return model.username;
		}
		
		public function get password():String {
			return model.password;
		}
		
		public function friendsTimelineResult(tweets:Array):void {
			currentTweets = new ArrayCollection(tweets);
		}
		
		public function setStatusResult():void {
			// reload tweets to get the newest
			loadTweets();
		}
		
		private function loginComplete(e:Event):void {
			loadTweets();
		}
		
	}
}