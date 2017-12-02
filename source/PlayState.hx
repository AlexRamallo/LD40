package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var view:GameView;
	var prog:PCProgram;
	var dbgtxt:FlxText;
	override public function create():Void
	{
		super.create();
		view = new GameView();		
		add(view.bg);
		
		prog = new PCProgram();
		prog.anchor = view.anchor_scr;
		prog.boot();
		
		view.showRoom();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.ESCAPE)
			Sys.exit(0);
		
		if (FlxG.keys.justPressed.SPACE)
			view.atPC?view.showRoom():view.showPC();
			
		prog.step(elapsed);
	}
}