package com.insideria.twitteria.controller {
	
	import org.puremvc.as3.patterns.command.MacroCommand;

	public class StartupCommand extends MacroCommand {
		
        /**
         * A Macro Command is one that fires off other commands in 
         * parallel. Here we kick off the model and view configuration commands
         */
        override protected function initializeMacroCommand():void {
            addSubCommand(ModelPrepCommand);
            addSubCommand(ViewPrepCommand);
        }
        
	}
}