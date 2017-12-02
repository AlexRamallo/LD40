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
	public var statsTxt:Array<FlxText> = [];
	
	var btnNext:FlxButton;
	var btnBack:FlxButton;
	
	var options:Array<FlxButton> = [];
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
		if (prog.data.acts_unlocked < idx){
			if (prog.data.acts_unlocked != idx - 1)
				prog.alert('You need to unlock the previous act first.');
			else
				prog.confirm(
					"Purchase Act?",
					"Pay $5000 to unlock this act?",
					function(){
						if(prog.data.money < 5000){
							prog.alert('Uh oh! You only have $$${prog.data.money}.\n\nTip: Try selling your follower\'s data to advertisers',"You're broke!");
						}else{
							prog.data.money -= 5000;
							prog.data.acts_unlocked++;
							var rr:FormScreen_SelectAct = cast prog.refreshScreen();
							rr.onSelect(idx);
						}
					});
		}else{
			var acts = prog.data.getAllActs();
			var sel = acts[idx];
			prog.shared.set("formsel_Act", sel);
			
			statsTxt[0].text = "Risk:\n\n" + Math.round(sel.risk) + "%";
			statsTxt[1].text = "Danger:\n\n" + sel.danger;
			statsTxt[2].text = "Stupidity:\n\n" + sel.stupidity + "/10";
		}
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
		if (txTitle == null) return;
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
			
			if(prog.data.acts_unlocked >= i - 1){
				options[i].text = act.name;
				
				if(prog.data.acts_unlocked >= i)
					options[i].label.color = 0x000000;
				else
					options[i].label.color = 0xA40B00;
			}else{
				options[i].text = "???";
			}
				
			options[i].x = root.x + (rx * hsep);
			options[i].y = root.y + (ry * vsep);
		}
	}
	
	public function onClickNext(){
		var sel:Stunt_Subject = cast prog.shared.get("formsel_Act");
		if(sel == null){
			prog.alert("You must select an act before continuing.");
			return;
		}
		prog.openScreen(new FormScreen_SelectSubject(prog));
	}
	
	public function onClickBack(){
		prog.goBack();
	}
	
	override public function onOpen():Void {
		super.onOpen();
		initUI();
	}
	
	override public function onClose():Void {
		super.onClose();
		
		remove(txTitle);
		remove(txInstruct);
		remove(statsBg);
		remove(btnNext);
		remove(btnBack);
		
		for (t in statsTxt){
			remove(t);
			FlxDestroyUtil.destroy(t);
		}
		
		for(o in options){
			remove(o);
			FlxDestroyUtil.destroy(o);
		}
			
		FlxDestroyUtil.destroy(txTitle);
		FlxDestroyUtil.destroy(txInstruct);
		FlxDestroyUtil.destroy(statsBg);
		FlxDestroyUtil.destroy(btnNext);
		FlxDestroyUtil.destroy(btnBack);
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
	}
	
}