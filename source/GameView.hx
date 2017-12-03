package;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.mouse.FlxMouseEventManager;
/**
 * ...
 * @author Alejandro Ramallo
 */
class GameView 
{
	public var bg:FlxSprite;
	public var pc:FlxSprite;
	public var atPC:Bool = false;
	public var prog:PCProgram;
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
	
	public function new() {
		bg = new FlxSprite(0, 0);		
		bg.loadGraphic(AssetPaths.desk__png, false, 1600, 1200);
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
		//Switch to game over scene
	}
	
	public function initPainkiller():FlxSprite{
		return initPainkiller1();
	}
	
	//Desk/otc meds
	public function initPainkiller1():FlxSprite{
		var painkillers = new FlxSprite();
		painkillers.loadGraphic(AssetPaths.painkillers_otc__png, false, 381, 96);
		
		painkillers.x = anchor_pain_1.x;
		painkillers.y = anchor_pain_1.y;
		
		FlxMouseEventManager.add(painkillers,
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
			}
		);
		
		return painkillers;
	}
	
	//hospital meds
	public function initPainkiller2():FlxSprite{
		var painkillers = new FlxSprite();
		painkillers.loadGraphic(AssetPaths.painkillers__png, false, 203, 138);
		
		painkillers.x = anchor_pain_2.x;
		painkillers.y = anchor_pain_2.y;
		
		FlxMouseEventManager.add(painkillers,
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
			}
		);
		
		return painkillers;
	}
	
}