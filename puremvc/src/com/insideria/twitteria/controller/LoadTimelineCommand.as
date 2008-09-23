package com.insideria.twitteria.controller {
	
	import com.insideria.twitteria.model.TimelineProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class LoadTimelineCommand extends SimpleCommand {
		
		override public function execute(note:INotification):void {
			var timelineProxy:TimelineProxy = facade.retrieveProxy(TimelineProxy.NAME) as TimelineProxy;
			timelineProxy.reload();
		}
		
	}
}