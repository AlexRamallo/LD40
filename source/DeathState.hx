package;
import flixel.FlxState;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;


class DeathState extends FlxState{
	
	public var bg:FlxSprite;
	
	public var txRIP:FlxText;
	public var txName:FlxText;
	public var txLine1:FlxText;
	public var txLine2:FlxText;
	public var txCauseOfDeath:FlxText;
	
	override public function create():Void{
		super.create();
		
		bg = new FlxSprite();
		bg.loadGraphic(AssetPaths.graveyard__png, false, 800, 600);
		
		txRIP = new FlxText();
		txName = new FlxText();
		txLine1 = new FlxText();
		txLine2 = new FlxText();
		txCauseOfDeath = new FlxText();	
		
		txRIP.size = 24;
		txName.size = 24;
		txLine1.size = 16;
		txLine2.size = 16;
		txCauseOfDeath.size = 24;
		
		txRIP.autoSize = false;
		txName.autoSize= false;
		txLine1.autoSize= false;
		txLine2.autoSize= false;
		txCauseOfDeath.autoSize = false;
		
		txRIP.fieldWidth= 328;
		txName.fieldWidth= 328;
		txLine1.fieldWidth= 328;
		txLine2.fieldWidth= 328;
		txCauseOfDeath.fieldWidth = 328;
		
		txRIP.alignment= CENTER;
		txName.alignment= CENTER;
		txLine1.alignment= CENTER;
		txLine2.alignment= CENTER;
		txCauseOfDeath.alignment = CENTER;
		
		txRIP.color= 0xFFFFFF;
		txName.color= 0xFFFFFF;
		txLine1.color= 0xFFFFFF;
		txLine2.color= 0xFFFFFF;
		txCauseOfDeath.color= 0xFFFFFF;
		
		txRIP.x = 203;
		txName.x = 203;
		txLine1.x = 203;
		txLine2.x = 203;
		txCauseOfDeath.x = 203;
		
		txRIP.y = 168;
		txName.y = txRIP.y + 40;
		txLine1.y = txName.y + 40;
		txLine2.y = txLine1.y + 40;
		txCauseOfDeath.y = txLine2.y + 40;
		
		txRIP.text = "R.I.P.";		
		txName.text = PlayState.prog.data.name;
		txLine1.text = "died how they lived.";
		txLine2.text = "CAUSE OF DEATH:";
		txCauseOfDeath.text = PlayState.prog.data.stunt_history.pop().getName();		
		
		add(bg);
		add(txRIP);
		add(txName);
		add(txLine1);
		add(txLine2);
		add(txCauseOfDeath);
	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE)
			Sys.exit(0);
	}
}