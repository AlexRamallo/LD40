package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var view:GameView;
	public static var prog:PCProgram = null;
	var dbgtxt:FlxText;
	var painkillers:FlxSprite;
	var painkillers2:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		view = new GameView();
		add(view.bg);
		
		if(prog == null)
			prog = new PCProgram();
		prog.view = view;
		prog.anchor = view.anchor_scr;
		prog.boot();
		
		view.prog = prog;
		view.showRoom();
		add(view.initPainkiller());
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