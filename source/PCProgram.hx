package;

/**
 * ...
 * @author Alejandro Ramallo
 */
import flixel.FlxG;
class PCProgram {
	
	public var data:PlayData;
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
	
}