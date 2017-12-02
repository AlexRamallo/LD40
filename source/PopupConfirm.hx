package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
/**
 * ...
 * @author ...
 */
class PopupConfirm extends FlxGroup
{
	public var questions:Dynamic;
	public var title:String;
	public var message:String;
	
	var bg:FlxSprite;
	var txTitle:FlxText;
	var txMsg:FlxText;
	var btn1:FlxButton;
	var btn2:FlxButton;
	
	public function new(t:String, m:String, ?q:{label1:String, onclick1:Void->Void, label2:String, onclick2:Void->Void}){
		super();
		title = t;
		message = m;
		questions = q;
	}
	
	public function init(){
		txTitle = new FlxText();
		txMsg = new FlxText();
		btn1 = new FlxButton(0,0,"",clicked1);
		btn2 = new FlxButton(0,0,"",clicked2);
		bg = new FlxSprite();
		
		bg.loadGraphic(AssetPaths.popup__png, false, 400, 300);
		
		add(bg);
		add(txTitle);
		add(txMsg);
		add(btn1);
		add(btn2);
	}
	
	public function clicked1(){
		if(questions!=null)
			questions.onclick1();
		close();
	}
	
	
	public function clicked2(){
		if(questions!=null)
			questions.onclick2();
		close();
	}
	
	public function show(pos:FlxPoint){
		bg.x = pos.x;
		bg.y = pos.y;
		
		txTitle.x = bg.x + 10;
		txTitle.y = bg.y + 10;
		
		txMsg.x = bg.x;
		txMsg.y = txTitle.y + 50;
		
		btn1.x = bg.x + 30;
		btn1.y = bg.y + (bg.height - 50);
		
		btn2.x = bg.x + 80;
		btn2.y = bg.y + (bg.height - 50);
		
		if (questions == null){
			btn1.text = "OK";
			btn2.visible = false;
		}else{
			btn1.text = questions.label1;			
			btn2.text = questions.label2;
			btn2.visible = true;
		}
			
		
		txTitle.size = 24;
		txTitle.text = title;
		txMsg.size = 16;
		txMsg.text = message;
	}
	
	public function close(){
		show(new FlxPoint(-1000, -1000));
	}
	
}