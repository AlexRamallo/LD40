package;

/**
 * ...
 * @author Alejandro Ramallo
 */
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import PopupConfirm;
import haxe.ds.StringMap;
class PCProgram {
	
	public var shared:StringMap<Dynamic>;
	
	public var trans:FlxSprite;
	private var transitionEffectActive:Bool = true;
	private var transitionPopupGuard:Int = 0;
	
	public var data:PlayData;
	public var popup:PopupConfirm;
	public var home:LaptopScreen;
	public var screens:Array<LaptopScreen>;

	public var anchor = {
		x: 0,
		y: 0
	};

	public function new() {
		screens = [];
		shared = new StringMap<Dynamic>();
		data = new PlayData(this);
		popup = new PopupConfirm("", "", null);
		popup.init();
	}
	
	public function boot(){
		openScreen(new HomeScreen(this));
	}
	
	private function initTransitionEffect(){
		trans = new FlxSprite();
		trans.loadGraphic(AssetPaths.transition__png, false, 571, 420);
		trans.x = anchor.x;
		trans.y = anchor.y;
		resetTransitionEffect();
	}
	
	private function resetTransitionEffect(){
		transitionEffectActive = false;
		FlxG.state.remove(trans);
		var cr = new FlxRect();
			cr.left = 0;
			cr.right = 571;
			cr.top = 0;
			cr.bottom = 420;
		
		trans.clipRect = cr;
	}
	
	private function showTransitionEffect(){
		if (trans == null)
			initTransitionEffect();
		trans.scale.y = 1;
		transitionEffectActive = true;
		transitionPopupGuard = 1;
	}
	
	public function openScreen(scr:LaptopScreen){
		var cur = screens[screens.length - 1];
		if(cur != null)
			cur.onClose();
		screens.push(scr);
		scr.onOpen();
		scr.setPos(anchor.x, anchor.y);
		FlxG.state.add(scr);
		showTransitionEffect();
	}
	
	public function refreshScreen():LaptopScreen{
		var cur = screens.pop();
		if (cur == null){
			goHome();
			return null;
		}
		cur.onClose();
		
		var nInst = Type.createInstance(Type.getClass(cur), [this]);
		openScreen(nInst);
		return nInst;
	}
	
	public function goBack(){
		var cur = screens.pop();
		if(cur != null)
			cur.onClose();
		var scr = screens[screens.length - 1];
		scr.onOpen();
		scr.setPos(anchor.x, anchor.y);
	}
	
	public function goHome(){
		for (s in screens)
			s.onClose();
		boot();
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
	
	public function died(){
		//handle death
	}
	
	
	var ect:Float = 0;
	public function step(elapsed){
		var active = screens[screens.length - 1];

		if(active!=null)
			active.onStep(elapsed);
		
		if (transitionEffectActive){
			if(transitionPopupGuard>0){
				transitionPopupGuard--;
				if (transitionPopupGuard <= 0)
					FlxG.state.add(trans);
				return;
			}
			var cr = trans.clipRect;
			if (cr.top < cr.bottom){
				ect += elapsed;
				if (ect >= 0.0225){
					cr.top += 40 + ((Math.random() * 20) * (Math.random() < 0.5? -1:1));
					trans.clipRect = cr;
					ect = 0;
				}
			}else{
				resetTransitionEffect();
			}
		}
	}
}