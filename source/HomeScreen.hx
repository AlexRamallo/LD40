package;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Alejandro Ramallo
 */
class HomeScreen extends BaseScreen{
	
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
		btnPastStunts = new FlxButton();
		btnAdNetworks = new FlxButton();
		
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
		btnPastStunts.text = "PAST STUNTS";
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
		
		add(btnNewStunt);
		add(btnPastStunts);
		add(btnAdNetworks);
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
		
		btnNewStunt.x = banner.x + 10;
		btnNewStunt.y = banner.y + 110;
		
		btnPastStunts.x = btnNewStunt.x;
		btnPastStunts.y = btnNewStunt.y + 50;
		
		btnAdNetworks.x = btnNewStunt.x;
		btnAdNetworks.y = btnPastStunts.y + 50;		
	}
	
	override public function onOpen():Void {
		super.onOpen();
		initHome();
	}
	
	override public function onClose():Void {
		super.onClose();
		
		remove(btnNewStunt);
		remove(btnPastStunts);
		remove(btnAdNetworks);
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
	}
	
}