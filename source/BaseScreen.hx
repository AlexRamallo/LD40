package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import UserAvatar;

/**
 * ...
 * @author Alejandro Ramallo
 */
class BaseScreen extends LaptopScreen
{
	public var prog:PCProgram;
	
	public var btnHome:FlxButton;
	
	public var banner:FlxSprite;
	public var banner2:FlxSprite;
	
	public var banner2_offset:Int = 0;	
	public var show_banner2:Bool = false;
	
	public var banner_avatar:UserAvatar;
	
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
		
		if(show_banner2){
			banner2 = new FlxSprite();
			banner2.loadGraphic(AssetPaths.banner2__png, false, 570, 100);
			banner2.pixelPerfectRender = true;
			add(banner2);
		}
		
		banner_avatar = prog.data.avatar;//new UserAvatar();
		
		btnHome = new FlxButton(0, 0, "RETURN HOME", prog.goHome);
		btnHome.scrollFactor.x = 1;
		btnHome.scrollFactor.y = 1;
		
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
		add(btnHome);
	}
	override public function setPos(x:Int, y:Int){
		if (banner == null) return;
		banner.x = x;
		banner.y = y;
		
		if(banner2!=null){
			banner2.x = banner.x;
			banner2.y = banner.y + 100 - banner2_offset;
		}
		
		banner_avatar.x = banner.x + 10;
		banner_avatar.y = banner.y + 10;
		
		banner_name.x = banner.x + 100;
		banner_name.y = banner.y + 10;
		
		btnHome.x = banner_name.x;
		btnHome.y = banner_name.y + 20;
		
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
		remove(banner);
		remove(banner2);
		remove(banner_avatar);
		remove(banner_name);
		remove(banner_followers);
		remove(banner_money);
		remove(btnHome);
		
		FlxDestroyUtil.destroy(btnHome);
		FlxDestroyUtil.destroy(banner);
		FlxDestroyUtil.destroy(banner2);
		FlxDestroyUtil.destroy(banner_name);
		FlxDestroyUtil.destroy(banner_followers);
		FlxDestroyUtil.destroy(banner_money);
	}
	override public function onStep(elapsed:Float):Void{
		updateBase();
	}
}