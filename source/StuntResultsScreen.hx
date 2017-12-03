package ;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.util.FlxDestroyUtil;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */

 class UserCommentWidget extends FlxGroup{
	 public var avatar:FlxSprite;
	 public var name:String;
	 public var msg:String;
	 public var followed:Bool;
	 
	 public function new(){
		super();
	 }
	 
	 public function init(){
		
	 }
 }
 
class StuntResultsScreen extends BaseScreen{
	
	public var activeStunt:Stunt;
	
	public function new(p) 
	{
		super(p);
	}
	
	private function initUI(){
			
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
		
		activeStunt = prog.shared.get("form_results_active_stunt");
		if (aStunt == null){
			prog.goBack();
			return;
		}	
		
		initUI();
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