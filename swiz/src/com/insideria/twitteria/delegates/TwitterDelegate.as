package com.insideria.twitteria.delegates {
	
	import com.insideria.twitteria.delegates.twitter.TwitterResponder;
	
	import org.swizframework.delegate.AbstractDelegate;
	
	import twitter.api.Twitter;
	import twitter.api.data.TwitterStatus;
	import twitter.api.data.TwitterUser;
	import twitter.api.events.TwitterEvent;
	
	public class TwitterDelegate extends AbstractDelegate {
		
		private var twitterService:Twitter;
		private var twitterResponder:TwitterResponder;
		private var useDummyData:Boolean = true;
		
		public function TwitterDelegate(twitterResponder:TwitterResponder) {
			twitterService = new Twitter();
			twitterService.setAuthenticationCredentials(twitterResponder.username, twitterResponder.password);
			this.twitterResponder = twitterResponder;
		}
		
		public function loadTimeline(username:String):void {
			trace("loading timeline for " + username);
			if (useDummyData) {
				var te:TwitterEvent = new TwitterEvent(TwitterEvent.ON_FRIENDS_TIMELINE_RESULT);
				te.data = getDummyData();
				friendsTimelineLoaded(te);
			} else {
				twitterService.addEventListener(TwitterEvent.ON_FRIENDS_TIMELINE_RESULT, friendsTimelineLoaded);
				twitterService.loadFriendsTimeline(username);
			}
		}
		
		public function setStatus(statusText:String):void {
			trace("setting status to '" + statusText + "'");
			if (useDummyData) {
				statusSet(null);
			} else {
				twitterService.addEventListener(TwitterEvent.ON_SET_STATUS, statusSet);
				twitterService.setStatus(statusText);
			}
		}
		
		private function friendsTimelineLoaded(te:TwitterEvent):void {
			twitterResponder.friendsTimelineResult(te.data as Array);
		}
		
		private function statusSet(te:TwitterEvent):void {
			twitterResponder.setStatusResult();
		}
		
		private function getDummyData():Array {
			var i:int;
			var statusObj:Object;
			var status:TwitterStatus;
			var dd:Array = [];
			var user:TwitterUser = new TwitterUser()
			user.name = "Dummy User";
			user.profileImageUrl = "https://static.twitter.com/images/default_profile_normal.png"
			for (;i <= 10; i++) {
				statusObj = { 
					id:i,
					created_at:"Sun Sep 21 22:15:04 +0000 2008",
					text: "Dummy message #" + i 
				}
				status = new TwitterStatus(statusObj, user);
				dd.push(status);
			}
			return dd;
		}
		

	}
}