package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxDestroyUtil;

/**
 * ...
 * @author Alejandro Ramallo
 */
class BaseScreen extends LaptopScreen
{
	public var prog:PCProgram;
	
	public var banner:FlxSprite;
	public var banner_avatar:FlxSprite;
	
	public var banner_name:FlxText;
	public var banner_health:FlxText;
	public var banner_followers:FlxText;
	public var banner_money:FlxText;
	
	public function new(p:PCProgram) {
		super();
		prog = p;
	}
	
	private function initBase(){
		banner = new FlxSprite();
		banner.loadGraphic(AssetPaths.banner__png, false, 570, 100);
		banner.pixelPerfectRender = true;
		
		banner_avatar = new FlxSprite();
		banner_avatar.loadGraphic(AssetPaths.avatar__png, false, 70, 70);
		
		banner_name = new FlxText();
		banner_health = new FlxText();
		banner_followers = new FlxText();
		banner_money = new FlxText();		
		
		banner_name.size = 14;
		banner_health.size = 14;
		banner_followers.size = 14;
		banner_money.size = 14;
		
		add(banner);
		add(banner_avatar);
		add(banner_name);
		add(banner_health);
		add(banner_followers);
		add(banner_money);
	}
	override public function setPos(x:Int, y:Int){
		banner.x = x;
		banner.y = y;
		
		banner_avatar.x = banner.x + 10;
		banner_avatar.y = banner.y + 10;
		
		banner_name.x = banner.x + 100;
		banner_name.y = banner.y + 10;
		
		banner_health.x = banner.x + 100;
		banner_health.y = banner.y + 60;
		
		banner_followers.x = banner.x + 370;
		banner_followers.y = banner.y + 10;
		
		banner_money.x = banner.x + 370;
		banner_money.y = banner.y + 60;
	}
	
	private function updateBase(){
		banner_name.text = prog.data.name;
		banner_health.text = "health: " + prog.data.health;
		banner_followers.text = 'followers: ${prog.data.followers}';
		banner_money.text = 'money: $$${prog.data.money}';
	}
	
	override public function onOpen():Void{
		initBase();
		updateBase();
	}
	override public function onClose():Void{
		FlxDestroyUtil.destroy(banner);
		FlxDestroyUtil.destroy(banner_avatar);
		FlxDestroyUtil.destroy(banner_name);
		FlxDestroyUtil.destroy(banner_followers);
		FlxDestroyUtil.destroy(banner_money);
	}
	override public function onStep(elapsed:Float):Void{
		
	}
}