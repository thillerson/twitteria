package com.insideria.twitteria.command {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.insideria.twitteria.business.TwitterDelegate;
	import com.insideria.twitteria.event.LoadTimelineEvent;
	import com.insideria.twitteria.event.SetStatusEvent;
	import com.insideria.twitteria.model.TwitteRIAModel;
	
	import mx.rpc.IResponder;
	
	public class SetStatusCommand implements ICommand, IResponder {
		
		private var model:TwitteRIAModel = TwitteRIAModel.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:SetStatusEvent = event as SetStatusEvent;
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.setStatus(evt.statusText);
		}
		
		public function result(result:Object):void {
			new LoadTimelineEvent().dispatch();
		}
		
		public function fault(fault:Object):void {
			
		}
		
	}
}