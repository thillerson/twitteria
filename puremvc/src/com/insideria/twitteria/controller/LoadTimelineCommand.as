package com.insideria.twitteria.command {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.insideria.twitteria.business.TwitterDelegate;
	import com.insideria.twitteria.event.LoadTimelineEvent;
	import com.insideria.twitteria.model.TwitteRIAModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	public class LoadTimelineCommand implements ICommand, IResponder {
		
		private var model:TwitteRIAModel = TwitteRIAModel.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:LoadTimelineEvent = event as LoadTimelineEvent;
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.loadTimeline();
		}
		
		public function result(result:Object):void {
			var stati:Array = result as Array;
			model.currentTweets = new ArrayCollection(stati);
		}
		
		public function fault(fault:Object):void {
			
		}
		
	}
}