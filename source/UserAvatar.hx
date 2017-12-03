package ;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxDestroyUtil;
import flixel.math.FlxPoint;
/**
 * ...
 * @author ...
 */
class UserAvatar extends FlxGroup
{
	public var x(get, set):Float;
	public var y(get, set):Float;
	
	public function set_x(set:Float):Float{
		setPos(set, bg.y);
		return bg.x;
	}
	public function get_x():Float{
		return bg.x;
	}
	
	public function set_y(set:Float):Float{
		setPos(bg.x, set);
		return bg.y;
	}
	public function get_y():Float{
		return bg.y;
	}	
	
	public static var background:Array<String> = [
		AssetPaths.bg1__png,
		AssetPaths.bg2__png,
		AssetPaths.bg3__png,
		AssetPaths.bg4__png,
		AssetPaths.bg5__png,
		AssetPaths.bg6__png,
		AssetPaths.bg7__png,
		AssetPaths.bg8__png,
		AssetPaths.bg9__png,
		AssetPaths.bg10__png
	];
	public static var foreground:Array<String> = [
		AssetPaths.fg1__png,
		AssetPaths.fg2__png,
		AssetPaths.fg3__png,
		AssetPaths.fg4__png,
		AssetPaths.fg5__png,
		AssetPaths.fg6__png,
		AssetPaths.fg7__png,
		AssetPaths.fg8__png,
		AssetPaths.fg9__png,
		AssetPaths.fg10__png
	];
	public static var frame:Array<String> = [
		AssetPaths.fr1__png,
		AssetPaths.fr2__png,
		AssetPaths.fr3__png,
		AssetPaths.fr4__png,
		AssetPaths.fr5__png,
		AssetPaths.fr6__png
	];
	public var bg:FlxSprite;
	public var fg:FlxSprite;
	public var fr:FlxSprite;
	
	public function new() {
		super();
	}
	
	public function initRandom(){
		init(
			Math.floor(Math.random() * background.length),
			Math.floor(Math.random() * foreground.length),
			Math.floor(Math.random() * frame.length)
		);
	}
	
	public function init(bg_i:Int, fore_i:Int, frame_i:Int){
		bg = new FlxSprite();
		fr = new FlxSprite();
		fg = new FlxSprite();
		
		bg.loadGraphic(background[bg_i], false, 70, 70);
		fg.loadGraphic(foreground[fore_i], false, 70, 70);
		fr.loadGraphic(frame[frame_i], false, 70, 70);
		
		add(bg);
		add(fg);
		add(fr);
	}
	
	public function onDestroyMe(){
		remove(bg);
		remove(fg);
		remove(fr);
		
		FlxDestroyUtil.destroy(bg);
		FlxDestroyUtil.destroy(fg);
		FlxDestroyUtil.destroy(fr);		
	}
	
	public function setPos(xx, yy){
		bg.x = fg.x = fr.x = xx;
		bg.y = fg.y = fr.y = yy;
	}
	
}