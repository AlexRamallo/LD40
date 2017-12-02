package;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxDestroyUtil;
import flixel.group.FlxGroup;
/**
 * ...
 * @author Alejandro Ramallo
 */
 
class FormScreen_SelectAct extends BaseScreen{
	
	public var txTitle:FlxText;
	public var txInstruct:FlxText;
	
	public var statsBg:FlxSprite;
	public var statsTxt:Array<FlxText>;
	
	var btnNext:FlxButton;
	var btnBack:FlxButton;
	
	var options:Array<FlxButton>;
	var rowSize:Int = 5;
	
	public function new(p) 
	{
		super(p);
	}
	
	private function initUI(){
		statsBg = new FlxSprite();
		statsBg.loadGraphic(AssetPaths.stats__png, false, 370, 70);
		txTitle = new FlxText();
		txInstruct = new FlxText();
		
		txTitle.text = "Select Act Type";
		txTitle.size = 16;
		txTitle.color = 0xFF4800;
		
		txInstruct.text = "choose the type of act you wish to perform";
		txInstruct.size = 12;
		txInstruct.color = 0xFF4800;
		
		statsTxt = [
			new FlxText(),
			new FlxText(),
			new FlxText()
		];
		
		var root = new FlxPoint(0, 0);
		
		var acts = prog.data.getAllActs();
		options = [];
		for(i in 0...acts.length){
			var btn = new FlxButton(0,0,"",function(){
				onSelect(i);
			});
			
			btn.scrollFactor.x = 1;
			btn.scrollFactor.y = 1;
			
			options.push(btn);
			add(btn);
		}		
		
		btnNext = new FlxButton(0, 0, "CONTINUE", onClickNext);
		btnBack = new FlxButton(0, 0, "GO BACK", onClickBack);
		
		btnNext.scrollFactor.x = 1;
		btnNext.scrollFactor.y = 1;
		
		btnBack.scrollFactor.x = 1;
		btnBack.scrollFactor.y = 1;
		
		add(txTitle);
		add(txInstruct);		
		add(statsBg);
		
		add(btnNext);
		add(btnBack);
		
		for (i in 0...statsTxt.length){
			statsTxt[i].color = 0xFF4800;
			statsTxt[i].size = 15;
			statsTxt[i].fieldWidth = 120;
			add(statsTxt[i]);
		}
	}
	
	public function onSelect(idx:Int){
		//Handle selection
		var acts = prog.data.getAllActs();
		var sel = acts[idx];
		
		statsTxt[0].text = "Risk:\n\n" + Math.round(sel.risk) + "%";
		statsTxt[1].text = "Danger:\n\n" + sel.danger;
		statsTxt[2].text = "Stupidity:\n\n" + sel.stupidity + "/10";
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
		
		txTitle.x = banner.x + 30;
		txTitle.y = banner.y + 110;
		
		txInstruct.x = txTitle.x;
		txInstruct.y = txTitle.y + 30;
		
		
		btnBack.x = banner.x + 9;
		
		statsBg.x = banner.x + 95;
		statsBg.y = banner.y + 345;
		
		btnBack.y = statsBg.y + 35;
			
		for (i in 0...statsTxt.length){
			statsTxt[i].x = statsBg.x + (121 * i) + 5;
			statsTxt[i].y = statsBg.y + 4;
		}
		
		btnNext.x = statsBg.x + statsBg.width + 10;
		btnNext.y = statsBg.y + 35;
		
		
		var acts = prog.data.getAllActs();
		var root = new FlxPoint(txInstruct.x, txInstruct.y + 30);
		var hsep = 100;
		var vsep = 50;
		for(i in 0...options.length){
			var act:Stunt_Act = acts[i];
			
			var rx = i % rowSize;
			var ry = Math.floor(i / rowSize);
			
			options[i].text = act.name;
			options[i].x = root.x + (rx * hsep);
			options[i].y = root.y + (ry * vsep);
		}
	}
	
	public function onClickNext(){
		//--
	}
	
	public function onClickBack(){
		//--
	}
	
	override public function onOpen():Void {
		super.onOpen();
		initUI();
	}
	
	override public function onClose():Void {
		super.onClose();
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
	}
	
}