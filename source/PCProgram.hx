package;

/**
 * ...
 * @author Alejandro Ramallo
 */
import flixel.FlxG;
import flixel.math.FlxPoint;
import PopupConfirm;
class PCProgram {
	
	public var data:PlayData;
	public var popup:PopupConfirm;
	public var home:LaptopScreen;
	public var screens:Array<LaptopScreen>;
	public var active:LaptopScreen;
	public var anchor = {
		x: 0,
		y: 0
	};

	public function new() {
		screens = [];
		home = new HomeScreen(this);
		data = new PlayData();
		popup = new PopupConfirm("", "", null);
		popup.init();
	}
	
	public function boot(){
		openScreen(home);
	}
	
	public function openScreen(scr:LaptopScreen){
		var cur = screens[screens.length - 1];
		if(cur != null)
			cur.onClose();
		screens.push(scr);
		scr.onOpen();
		scr.setPos(anchor.x, anchor.y);
		FlxG.state.add(scr);
	}
	
	public function goBack(){
		var cur = screens.pop();
		if(cur != null)
			cur.onClose();
		screens[screens.length - 1].onOpen();
	}
	
	public function goHome(){
		var cur = screens.pop();
		if(cur != null)
			cur.onClose();
		screens = [];
		boot();
	}
	
	public function step(elapsed){
		if(active!=null)
			active.onStep(elapsed);
	}
	
	public function confirm(title, msg, onconfirm:Void->Void, ?oncancel:Void->Void){
			popup.title = title;
			popup.message = msg;
			popup.questions = {
				label1: "Yes",
				onclick1: onconfirm,
				label2: "No",
				onclick2: oncancel
			};
			var pt = new FlxPoint();
			pt.x = FlxG.camera.x + 555;
			pt.y = FlxG.camera.y + 350;
			popup.show(pt);
	}
	
	public function alert(msg:String, title:String = "ALERT:"){
			popup.title = title;
			popup.message = msg;
			popup.questions = null;
			var pt = new FlxPoint();
			pt.x = FlxG.camera.x + 555;
			pt.y = FlxG.camera.y + 350;
			popup.show(pt);
	}
}