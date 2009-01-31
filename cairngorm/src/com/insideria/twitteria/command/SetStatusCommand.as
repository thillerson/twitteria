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
		
		/**
		 * execute is where the main responsibilities of the command 
		 * are executed.
		 */		
		public function execute(event:CairngormEvent):void {
			var evt:SetStatusEvent = event as SetStatusEvent;
			var delegate:TwitterDelegate = new TwitterDelegate(this);
			delegate.setStatus(evt.statusText);
		}
		
		/**
		 * This command is a responder, so when a service call is done
		 * it will call result
		 */		
		public function result(result:Object):void {
			new LoadTimelineEvent().dispatch();
		}
		
		/**
		 * This command is a responder, so when a service call fails
		 * it will call fault
		 */		
		public function fault(fault:Object):void {
			
		}
		
	}
}