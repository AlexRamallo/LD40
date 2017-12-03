package ;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.util.FlxDestroyUtil;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
/**
 * ...
 * @author ...
 */

 class UserCommentWidget extends FlxGroup{
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
	
	 public var bg:FlxSprite;
	 public var thumb:FlxSprite;
	 public var avatar:UserAvatar;
	 public var txMessage:FlxText;
	 public var txName:FlxText;
	 
	 public var name:String;
	 public var msg:String;
	 public var followed:Bool;
	 
	 public function new(){
		super();
	 }
	 
	 public function init(good:Bool){
		bg = new FlxSprite();
		bg.loadGraphic(AssetPaths.comment_back__png, false, 332, 88);
		
		thumb = new FlxSprite();
		thumb.loadGraphic(AssetPaths.thumbs_14x14__png, true, 14, 14);
		
		avatar = new UserAvatar();
		avatar.initRandom();
		followed = good;
		name = NameGenerator.generateName();
		if (good){
			msg = CommentGenerator.generateGoodComment();
			thumb.animation.frameIndex = 0;
		}else{
			msg = CommentGenerator.generateBadComment();
			thumb.animation.frameIndex = 1;
		}
			
		txName = new FlxText();
		txMessage = new FlxText();
		
		txName.text = name;
		txName.color = 0xFF4800;
		txMessage.text = msg;
		txMessage.color = 0xFF4800;
			
		add(bg);
		add(thumb);
		add(avatar);
		add(txMessage);
		add(txName);
	 }
	 
	 public function setPos(xx, yy){
		 bg.x = xx;
		 bg.y = yy;
		 
		 avatar.x = bg.x + 7;
		 avatar.y = bg.y + 9;
		 
		 txName.x = avatar.x + 70 + 12;
		 txName.y = bg.y + 4;
		 
		 txMessage.x = txName.x;
		 txMessage.y = txName.y + 20;
		 txMessage.fieldWidth = 240;
		 
		 thumb.x = bg.x + (bg.width - 2) - 20;
		 thumb.y = bg.y + 6;
	 }
	 
	 public function onDestroyMe(){
		remove(bg);
		remove(thumb);
		remove(avatar);
		remove(txMessage);
		remove(txName);
		
		FlxDestroyUtil.destroy(bg);
		FlxDestroyUtil.destroy(thumb);
		FlxDestroyUtil.destroy(avatar);
		FlxDestroyUtil.destroy(txMessage);
		FlxDestroyUtil.destroy(txName);
	 }
 }
 
class StuntResultsScreen extends BaseScreen{
	
	public var activeStunt:Stunt;
	
	public var txStuntName:FlxText;
	public var txStuntComments:FlxText;
	public var txStuntRes:FlxText;
	public var txStuntRes_followers:FlxText;
	public var txStuntRes_damage:FlxText;
	public var txStuntRes_accident:FlxText;
	
	public var comments:Array<UserCommentWidget>;
	private var numComments = 3;
	
	public function new(p) 
	{
		super(p);
		comments = [];
	}
	
	private function initUI(){
		txStuntName = new FlxText();
		txStuntComments = new FlxText();
		txStuntRes = new FlxText();
		txStuntRes_followers = new FlxText();
		txStuntRes_damage = new FlxText();
		txStuntRes_accident= new FlxText();
		
		txStuntName.color 			= 0xFFFFFF;
		txStuntComments.color 		= 0xFF4800;
		txStuntRes.color 			= 0xFF4800;
		txStuntRes_followers.color 	= 0xFF4800;
		txStuntRes_damage.color 	= 0xFF4800;
		txStuntRes_accident.color 	= 0xFF4800;
		
		txStuntName.size 			= 16;
		txStuntComments.size 		= 8;
		
		txStuntName.fieldWidth = 548;
		
		txStuntRes.size			 	= 16;
		txStuntRes_followers.size 	= 16;
		txStuntRes_damage.size	 	= 16;
		txStuntRes_accident.size 	= 16;
		
		txStuntComments.text = "Viewer Comments";
		txStuntName.text = activeStunt.getName();
		
		txStuntRes.text = "STUNT RESULTS:";
		txStuntRes_followers.text = "- Net Followers:\n    " + activeStunt.result_followers;
		txStuntRes_accident.text = activeStunt.result_accident?"- ACCIDENT OCCURRED":"- NO ACCIDENTS";
		txStuntRes_damage.text = "- " + activeStunt.result_damage + " Health Lost";
		
		add(txStuntName);
		add(txStuntComments);
		add(txStuntRes);
		add(txStuntRes_followers);
		add(txStuntRes_damage);
		add(txStuntRes_accident);
		
		for(i in 0...numComments){
			var cw = new UserCommentWidget();
			cw.init(Math.random() < 0.5?true:false);
			comments.push(cw);
			add(cw);
		}
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
		
		txStuntName.x = banner.x + 10;
		txStuntName.y = banner.y + 108;
		
		txStuntRes.x = txStuntName.x;
		txStuntRes.y = txStuntName.y + 50;
		
		txStuntRes_accident.x = txStuntRes.x;
		txStuntRes_accident.y = txStuntRes.y + 35;
		
		txStuntRes_damage.x = txStuntRes_accident.x;
		txStuntRes_damage.y = txStuntRes_accident.y + 30;
		
		txStuntRes_followers.x = txStuntRes_damage.x;
		txStuntRes_followers.y = txStuntRes_damage.y + 30;
		
		var spacing = 86;
		for(i in 0...comments.length){
			var cw = comments[i];
			cw.setPos(
				banner.x + banner.width - 337,
				banner.y + 415 - (comments.length * spacing) + (spacing * i)
			);
		}
		
		txStuntComments.x = comments[0].x;
		txStuntComments.y = comments[0].y - 12;
	}
	
	override public function onOpen():Void {
		show_banner2 = true;
		banner2_offset = 62;
		super.onOpen();
		
		activeStunt = prog.shared.get("form_results_active_stunt");
		if (activeStunt == null){
			prog.goBack();
			return;
		}	
		
		initUI();
	}
	
	override public function onClose():Void {
		super.onClose();
		
		for(i in 0...numComments){
			var cw = comments[i];
			cw.onDestroyMe();
			FlxDestroyUtil.destroy(cw);
			remove(cw);
		}
		
		remove(txStuntName);
		remove(txStuntComments);
		remove(txStuntRes);
		remove(txStuntRes_followers);
		remove(txStuntRes_damage);
		remove(txStuntRes_accident);
		
		FlxDestroyUtil.destroy(txStuntName);
		FlxDestroyUtil.destroy(txStuntComments);
		FlxDestroyUtil.destroy(txStuntRes);
		FlxDestroyUtil.destroy(txStuntRes_followers);
		FlxDestroyUtil.destroy(txStuntRes_damage);
		FlxDestroyUtil.destroy(txStuntRes_accident);
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
	}
	
}