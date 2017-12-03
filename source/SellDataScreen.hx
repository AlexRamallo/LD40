package ;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.util.FlxDestroyUtil;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

/**
 * ...
 * @author ...
 */

class MerchantWidget extends FlxGroup{
	public var prog:PCProgram;
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
	
	public var name:String;
	public var desc:String;
	public var basket:Int;
	public var rate:Float;
	
	public var bg:FlxSprite;
	public var txName:FlxText;
	public var txDescription:FlxText;
	public var txBasket:FlxText;
	public var txRate:FlxText;
	public var btnSell:FlxButton;
	
	
	public function new(p,n,d,b,r){
		super();
		prog = p;
		name = n;
		desc = d;
		basket = b;
		rate = r;
	}
	
	public function init(){
		txName = new FlxText();
		txDescription = new FlxText();
		txBasket = new FlxText();
		txRate = new FlxText();
		
		btnSell = new FlxButton(0, 0, "Sell Here", onSell);
		btnSell.scrollFactor.x = 1;
		btnSell.scrollFactor.y = 1;
		
		bg = new FlxSprite();
		bg.loadGraphic(AssetPaths.merchant_back__png, false, 165, 195);
		
		txName.color 		= 0xFFFFFF;
		txDescription.color = 0xFFFFFF;
		txBasket.color 		= 0xFF4800;
		txRate.color 		= 0xFF4800;
		
		txName.size 		= 12;
		txDescription.size 	= 8;
		txBasket.size 		= 10;
		txRate.size 		= 10;
		
		txName.text = name;		
		txDescription.text = desc;
		txBasket.text = "Basket: "+basket;
		txRate.text = "Rate: $"+rate;
		
		add(bg);
		add(txName);
		add(txDescription);
		add(txBasket);
		add(txRate);
		add(btnSell);
	}
	
	public function setPos(xx, yy){
		bg.x = xx;
		bg.y = yy;
		
		txName.x = bg.x + 2;
		txName.y = bg.y + 6;
		txName.autoSize = false;
		txName.fieldWidth = 161;
		txName.alignment = CENTER;
		
		txDescription.x = txName.x;
		txDescription.y = txName.y + 60;
		txDescription.autoSize = false;
		txDescription.fieldWidth = 161;
		txDescription.alignment = CENTER;
		
		txRate.x = txDescription.x;
		txRate.y = bg.y + bg.height - 61 - 15;
		txRate.autoSize = false;
		txRate.fieldWidth = 150;
		txRate.alignment = RIGHT;
		
		txBasket.x = txDescription.x;
		txBasket.y = txRate.y - 12;
		txBasket.autoSize = false;
		txBasket.fieldWidth = 150;
		txBasket.alignment = RIGHT;
		
		btnSell.x = txRate.x + 30;
		btnSell.y = txRate.y + 30;
	}
	
	public function onDestroyMe(){
		remove(bg);
		remove(txName);
		remove(txDescription);
		remove(txBasket);
		remove(txRate);
		remove(btnSell);
		
		FlxDestroyUtil.destroy(bg);
		FlxDestroyUtil.destroy(txName);
		FlxDestroyUtil.destroy(txDescription);
		FlxDestroyUtil.destroy(txBasket);
		FlxDestroyUtil.destroy(txRate);
		FlxDestroyUtil.destroy(btnSell);
	}
	
	
	public function onSell(){
		//Handle sale
		var amount = Math.floor(prog.data.follower_data / basket) * basket;
		var total = Math.floor(amount * rate);
		prog.confirm(
			"Confirm Sale",
			'sell $amount data at $$$rate/unit for a total of: $$$total?',
			function(){
				prog.data.follower_data -= amount;
				prog.data.money += total;
				prog.alert("Sale Complete");
			}
		);
	}
}
 
class SellDataScreen extends BaseScreen{
	public var txTitle:FlxText;
	public var txInstruct:FlxText;
	
	public var txAvailableData:FlxText;
	
	public var merchants:Array<MerchantWidget>;
	
	public function new(p) 
	{
		super(p);
	}
	
	public function updateRecords(){
		txAvailableData.text = "Data: "+ prog.data.follower_data;
	}
	private function initUI(){
		
		txTitle = new FlxText();
		txInstruct = new FlxText();
		txAvailableData = new FlxText();
		
		txTitle.text = "Personal Data Auctions";
		txTitle.size = 16;
		txTitle.color = 0xFFFFFF;
		
		txInstruct.text = "It's their fault for not reading the privacy policy";
		txInstruct.size = 12;
		txInstruct.color = 0xFFFFFF;		
		txInstruct.fieldWidth = 450;
		
		txAvailableData.text = "";
		txAvailableData.size = 12;
		txAvailableData.color = 0xFF4800;
		
		merchants = [
			new MerchantWidget(prog,
				"Dirty Earl's Masturbatorium Emporium",
				"Don't by shy, Dirty E will buy absolutely ANY data you have to offer!",
				1, 		//Basket
				0.25),	//Rate
			new MerchantWidget(prog,
				"United States National Security Agency",
				"Don't ask, don't tell.",
				100000,	//Basket
				1.5),	//Rate
			new MerchantWidget(prog,
				"WhereVillainsMeet.com",
				"Find your perfect match today!",
				10000,	//Basket
				1.00),	//Rate
		];
		
		for (m in merchants){
			m.init();
			add(m);
		}
				
		add(txTitle);
		add(txInstruct);
		add(txAvailableData);
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
				
		txTitle.x = banner.x + 30;
		txTitle.y = banner.y + 105;
		
		txInstruct.x = txTitle.x;
		txInstruct.y = txTitle.y + 30;
		
		txAvailableData.x = banner.x + 10;
		txAvailableData.y = txInstruct.y + 30;
		txAvailableData.autoSize = false;
		txAvailableData.fieldWidth = 550;
		txAvailableData.alignment = CENTER;
		
		for (i in 0...merchants.length){
			var m = merchants[i];
			m.x = banner.x + 10 + (190 * i);
			m.y = txAvailableData.y + 20;
		}
	}
	
	override public function onOpen():Void {
		show_banner2 = true;
		banner2_offset = 40;
		super.onOpen();
		initUI();
	}
	
	override public function onClose():Void {
		super.onClose();
				
		remove(txTitle);
		remove(txInstruct);
		remove(txAvailableData);
		
		FlxDestroyUtil.destroy(txTitle);
		FlxDestroyUtil.destroy(txInstruct);
		FlxDestroyUtil.destroy(txAvailableData);
		
				
		for (m in merchants){
			m.onDestroyMe();
			remove(m);
			FlxDestroyUtil.destroy(m);
		}
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
		updateRecords();
	}
	
}