package;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxDestroyUtil;
/**
 * ...
 * @author Alejandro Ramallo
 */
class GameView 
{
	public var isHome:Bool = true;
	public var bg:FlxSprite;
	public var pc:FlxSprite;
	public var atPC:Bool = false;
	public var prog:PCProgram;
	public var txPainInfo:FlxText;
	public var txKeyInfo:FlxText;
	
	public var key1:FlxSprite;
	public var key2:FlxSprite;
	public var painkill1:FlxSprite;
	public var painkill2:FlxSprite;
	
	public var anchor_pc = {
		x: 	379,
		y: 198
	};
	public var anchor_scr = {
		x: 493,
		y: 287
	};
	public var anchor_pain_1 = {
		x: -5,
		y: 743
	};
	public var anchor_pain_2 = {
		x: 137,
		y: 839
	};
	
	public var anchor_key_1 = {
		x: 1357,
		y: 554
	};
	public var anchor_key_2 = {
		x: 1309,
		y: 722
	};
	
	public function new(home:Bool = true) {
		isHome = home;
	}
	
	public function loadBg(){
		bg = new FlxSprite(0, 0);
		if(isHome)
			bg.loadGraphic(AssetPaths.desk__png, false, 1600, 1200);
		else
			bg.loadGraphic(AssetPaths.hospital__png, false, 1600, 1200);
		FlxG.state.add(bg);
		
		initPainkiller();
		initKeys();
	}
	
	public function switchRoom(){
		isHome = !isHome;
		
		FlxG.state.remove(bg);
		FlxDestroyUtil.destroy(bg);

		loadBg();
	}
	
	public function showRoom(){
		atPC = false;
		FlxG.camera.zoom = 0.5;
		FlxG.camera.scroll.x = 400;
		FlxG.camera.scroll.y = 300;
	}
	
	public function showPC(){
		atPC = true;
		FlxG.camera.zoom = 1;
		FlxG.camera.scroll.x = anchor_pc.x;
		FlxG.camera.scroll.y = anchor_pc.y;
	}
	
	public function died(){
		//Handle death
	}
	
	public function initPainkiller(){
		if(txPainInfo == null){
			txPainInfo = new FlxText();
			FlxG.state.add(txPainInfo);
		}
		
		var pk = null;
		if (isHome){
			initPainkiller1();
			pk = painkill1;
		}else{
			initPainkiller2();
			pk = painkill2;
		}
		
		txPainInfo.x = pk.x;
		txPainInfo.y = pk.y - 80;
		txPainInfo.autoSize = false;
		txPainInfo.fieldWidth = pk.width;
		txPainInfo.alignment = CENTER;
		txPainInfo.size = 24;
	}
		
	public function initKeys(){
		if(txKeyInfo == null){
			txKeyInfo = new FlxText();
			FlxG.state.add(txKeyInfo);
		}
		
		var kk = null;
		if (isHome){
			initKey1();
			kk = key1;
		}else{
			initKey2();
			kk = key2;
		}
		
		txKeyInfo.x = kk.x;
		txKeyInfo.y = kk.y - 80;
		txKeyInfo.autoSize = false;
		txKeyInfo.fieldWidth = kk.width * 1.5;
		txKeyInfo.alignment = CENTER;
		txKeyInfo.size = 24;
	}
	
	//Desk keys/goto hospital
	public function initKey1(){
		if(key1 == null){
			key1 = new FlxSprite();
			key1.loadGraphic(AssetPaths.keys1__png, false, 112, 209);		
			FlxMouseEventManager.add(key1,
				//onMouseDown
				function(spr:FlxSprite){
					prog.confirm(
						"Drive to hospital?",
						"Check yourself into the hospital if you need stronger meds",
						function(){
							switchRoom();
						}
					);
				},
				null,
				//onMouseOver
				function(spr:FlxSprite){
					spr.scale.x = 1.2;
					spr.scale.y = 1.2;
				},
				//onMouseOut
				function(spr:FlxSprite){
					spr.scale.x = 1;
					spr.scale.y = 1;
				}
			);
			FlxG.state.add(key1);
		}
		
		key1.x = anchor_key_1.x;
		key1.y = anchor_key_1.y;		
		txKeyInfo.text = "Go to Hospital";
		
		if(key2!=null)
			key2.x = -1000;
	}
	
	//Hopspital keys/goto desk
	public function initKey2(){
		if(key2 == null){
			key2 = new FlxSprite();
			key2.loadGraphic(AssetPaths.keys2__png, false, 112, 209);
			
			FlxMouseEventManager.add(key2,
				//onMouseDown
				function(spr:FlxSprite){
					prog.confirm(
						"Drive Home?",
						"Home is where the cheap stuff is",
						function(){
							switchRoom();
						}
					);
				},
				null,
				//onMouseOver
				function(spr:FlxSprite){
					spr.scale.x = 1.2;
					spr.scale.y = 1.2;
				},
				//onMouseOut
				function(spr:FlxSprite){
					spr.scale.x = 1;
					spr.scale.y = 1;
				}
			);
			FlxG.state.add(key2);
		}
		
		key2.x = anchor_key_2.x;
		key2.y = anchor_key_2.y;		
		txKeyInfo.text = "Go Home";
		
		if(key1!=null)
			key1.x = -1000;
	}
	
	//Desk/otc meds
	public function initPainkiller1(){
		if(painkill1 == null){
			painkill1 = new FlxSprite();
			painkill1.loadGraphic(AssetPaths.painkillers_otc__png, false, 381, 96);
			
			FlxMouseEventManager.add(painkill1,
				//onMouseDown
				function(spr:FlxSprite){
					if(prog.data.money >= prog.data.cost_painkillers){
						prog.data.money -= prog.data.cost_painkillers;
						var recover:Int = Std.int(prog.data.painkiller_recovery - prog.data.painkiller_tolerance);
						if (recover < 0)
							recover = 0;
							
						prog.data.health += recover;
						if (prog.data.health > 100)
							prog.data.health = 100;
							
						prog.data.painkiller_tolerance *= prog.data.painkiller_tolerance_rate;
						
						prog.alert('You recovered $recover health.\n\nTip: if your tolerance gets too high, you can find stronger drugs at the hospital');
					}else{
						prog.alert('You need at least $$${prog.data.cost_painkillers} to buy pain killers');
					}
				},
				null,
				//onMouseOver
				function(spr:FlxSprite){
					spr.scale.x = 1.2;
					spr.scale.y = 1.2;
				},
				//onMouseOut
				function(spr:FlxSprite){
					spr.scale.x = 1;
					spr.scale.y = 1;
				}
			);
			FlxG.state.add(painkill1);
		}
		
		painkill1.x = anchor_pain_1.x;
		painkill1.y = anchor_pain_1.y;
		txPainInfo.text = "Pain Meds\n$" + prog.data.cost_painkillers;
		
		if(painkill2!=null)
			painkill2.x = -1000;
	}
	
	//hospital meds
	public function initPainkiller2(){
		if(painkill2 == null){
			painkill2 = new FlxSprite();
			painkill2.loadGraphic(AssetPaths.painkillers__png, false, 203, 138);
			
			FlxMouseEventManager.add(painkill2,
				//onMouseDown
				function(spr:FlxSprite){
					if(prog.data.money >= prog.data.cost_painkillers2){
						prog.data.money -= prog.data.cost_painkillers2;
						var recover:Int = Std.int(prog.data.painkiller2_recovery - prog.data.painkiller2_tolerance);
						if (recover < 0)
							recover = 0;
							
						prog.data.health += recover;
						if (prog.data.health > 100)
							prog.data.health = 100;
							
						prog.data.painkiller2_tolerance *= prog.data.painkiller2_tolerance_rate;
						
						prog.alert('You recovered $recover health.\n\nTip: use sparingly');
					}else{
						prog.alert('You need at least $$${prog.data.cost_painkillers2} to buy pain killers');
					}
				},
				null,
				//onMouseOver
				function(spr:FlxSprite){
					spr.scale.x = 1.2;
					spr.scale.y = 1.2;
				},
				//onMouseOut
				function(spr:FlxSprite){
					spr.scale.x = 1;
					spr.scale.y = 1;
				}
			);
			FlxG.state.add(painkill2);
		}
			
		painkill2.x = anchor_pain_2.x;
		painkill2.y = anchor_pain_2.y;
		txPainInfo.text = "Pain Meds\n$" + prog.data.cost_painkillers2;
		
		if(painkill1!=null)
			painkill1.x = -1000;
	}
	
}