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
		
		if(prog == null)
			prog = new PCProgram();
		prog.view = view;
		prog.data.view = view;
		prog.anchor = view.anchor_scr;
		
		view.prog = prog;		
		
		
		view.loadBg();
		prog.boot();
		view.showRoom();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.SPACE)
			view.atPC?view.showRoom():view.showPC();
			
		prog.step(elapsed);
	}
}