package;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxG;
/**
 * ...
 * @author Alejandro Ramallo
 */
class GameView 
{

	public var bg:FlxSprite;
	public var pc:FlxSprite;
	public var atPC:Bool = false;
	public var anchor_pc = {
		x: 	371,
		y: 246
	};
	public var anchor_scr = {
		x: 466,
		y: 317
	};
	
	public function new() {
		bg = new FlxSprite(0, 0);		
		bg.loadGraphic(AssetPaths.bg1__png, false, 1600, 1200);
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
	
}