package;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.util.FlxDestroyUtil;
import flixel.text.FlxText;

/**
 * ...
 * @author Alejandro Ramallo
 */
class HomeScreen extends BaseScreen{
	public var txTitle:FlxText;
	public var txInstruct:FlxText;
	
	public var txCredits:FlxText;
	
	public var txStuntsInfo:FlxText;
	public var txStunts:Array<FlxText>;
	
	public var btnNewStunt:FlxButton;
	public var btnPastStunts:FlxButton;
	public var btnAdNetworks:FlxButton;
	
	public function new(p) 
	{
		super(p);
	}
	
	private function initHome(){
		btnNewStunt = new FlxButton(0, 0, "", function(){
			prog.openScreen(new NewStuntScreen(prog));
		});
		
		btnAdNetworks = new FlxButton(0, 0, "", function(){
			prog.openScreen(new SellDataScreen(prog));
		});
		
		btnPastStunts = new FlxButton(0, 0, "", function(){
			prog.alert("higher risk and danger gives higher reward. Don't repeat stunts.\n\nPress SPACE to access meds and hospital");
		});
		
		txTitle = new FlxText();
		txInstruct = new FlxText();
		txCredits = new FlxText();
		txStuntsInfo = new FlxText();
		
		txTitle.text = "Welcome to coolstunts.geocities.com!";
		txTitle.size = 16;
		txTitle.color = 0xFFFFFF;
		
		txInstruct.text = "Post your stunts and try to get the most followers\n(just try to not get yourself killed)";
		txInstruct.size = 12;
		txInstruct.color = 0xFFFFFF;		
		txInstruct.fieldWidth = 450;
		
		txCredits.text = "Created in 48 hours for Ludum Dare 40 by @AlexRamallo";
		txCredits.size = 12;
		txCredits.color = 0xFF4800;	
		
		txStuntsInfo.text = "Your Recent Stunts";
		txStuntsInfo.size = 12;
		txStuntsInfo.color = 0xFF4800;	
		
		txStunts = [];
		for(i in 0...prog.data.memory){
			var st = prog.data.stunt_history[(prog.data.stunt_history.length - 1) - i];
			txStunts[i] = new FlxText();
			if(st!=null)
				txStunts[i].text = "- "+st.getName();
			else
				txStunts[i].text = "- <nothing>";
			txStunts[i].size = 10;
			txStunts[i].color = 0xFF4800;
			add(txStunts[i]);
		}

		btnNewStunt.scrollFactor.x = 1;
		btnNewStunt.scrollFactor.y = 1;
		
		btnPastStunts.scrollFactor.x = 1;
		btnPastStunts.scrollFactor.y = 1;
		
		btnAdNetworks.scrollFactor.x = 1;
		btnAdNetworks.scrollFactor.y = 1;
		
		btnNewStunt.scale.x = btnNewStunt.scale.y = 2;
		btnPastStunts.scale.x = btnPastStunts.scale.y = 2;
		btnAdNetworks.scale.x = btnAdNetworks.scale.y = 2;
		
		btnNewStunt.text = "NEW STUNT";
		btnPastStunts.text = "INFO";
		btnAdNetworks.text = "SELL DATA";
		
		var defoff = [
			new FlxPoint(0, 10),
			new FlxPoint(0, 10),
			new FlxPoint(0, 10)
		];
		
		btnNewStunt.updateHitbox();
		btnNewStunt.label.fieldWidth *= 2;
		btnNewStunt.label.size = 14;
		btnNewStunt.labelOffsets = defoff;
		
		btnPastStunts.updateHitbox();
		btnPastStunts.label.fieldWidth *= 2;
		btnPastStunts.label.size = 14;
		btnPastStunts.labelOffsets = defoff;
		
		btnAdNetworks.updateHitbox();
		btnAdNetworks.label.fieldWidth *= 2;
		btnAdNetworks.label.size = 14;		
		btnAdNetworks.labelOffsets = defoff;
				
		add(txTitle);
		add(txInstruct);
		add(txCredits);
		add(txStuntsInfo);
		add(btnNewStunt);
		add(btnPastStunts);
		add(btnAdNetworks);
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
		
		if (txTitle == null) return;
				
		txTitle.x = banner.x + 30;
		txTitle.y = banner.y + 110;
		
		txInstruct.x = txTitle.x;
		txInstruct.y = txTitle.y + 30;
		
		txCredits.x = banner.x + 10;
		txCredits.y = banner.y + 420 - 20;
		txCredits.fieldWidth = 550;
		txCredits.alignment = CENTER;
		txCredits.autoSize = false;

		txStuntsInfo.x = banner.x + 200;
		txStuntsInfo.y = banner.y + 190;
		txStuntsInfo.fieldWidth = 360;
		txStuntsInfo.alignment = CENTER;
		txStuntsInfo.autoSize = false;
		
		var sep = 25;
		for(i in 0...prog.data.memory){
			txStunts[i].autoSize = false;
			txStunts[i].fieldWidth = 360;
			txStunts[i].alignment = LEFT;
			txStunts[i].x = txStuntsInfo.x;
			txStunts[i].y = txStuntsInfo.y + 20 + (sep * i);
		}
		
		btnNewStunt.x = banner.x + 10;
		btnNewStunt.y = banner.y + 210;
		
		btnPastStunts.x = btnNewStunt.x;
		btnPastStunts.y = btnNewStunt.y + 50;
		
		btnAdNetworks.x = btnNewStunt.x;
		btnAdNetworks.y = btnPastStunts.y + 50;		
	}
	
	override public function onOpen():Void {
		show_banner2 = true;
		banner2_offset = 20;
		
		super.onOpen();
		initHome();
	}
	
	override public function onClose():Void {
		super.onClose();
				
		remove(txTitle);
		remove(txInstruct);
		remove(txCredits);
		remove(txStuntsInfo);
		remove(btnNewStunt);
		remove(btnPastStunts);
		remove(btnAdNetworks);
		
		for(i in 0...prog.data.memory){
			remove(txStunts[i]);
			FlxDestroyUtil.destroy(txStunts[i]);
		}
					
		FlxDestroyUtil.destroy(txTitle);
		FlxDestroyUtil.destroy(txInstruct);
		FlxDestroyUtil.destroy(txCredits);
		FlxDestroyUtil.destroy(txStuntsInfo);
		FlxDestroyUtil.destroy(btnNewStunt);
		FlxDestroyUtil.destroy(btnPastStunts);
		FlxDestroyUtil.destroy(btnAdNetworks);
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
	}
	
}