package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.FlxG;
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
		txTitle = new FlxText(0,0,300);
		txMsg = new FlxText(0,0,300);
		btn1 = new FlxButton(0,0,"",clicked1);
		btn2 = new FlxButton(0, 0, "", clicked2);
		
		btn1.scrollFactor.x = 1;
		btn1.scrollFactor.y = 1;
		
		btn2.scrollFactor.x = 1;
		btn2.scrollFactor.y = 1;
		
		bg = new FlxSprite();
		
		bg.loadGraphic(AssetPaths.popup__png, false, 452, 352);
		
		add(bg);
		add(txTitle);
		add(txMsg);
		add(btn1);
		add(btn2);
	}
	
	public function clicked1(){
		close();
		if (questions != null)
			if(questions.onclick1 != null)
				questions.onclick1();
	}
	
	
	public function clicked2(){
		close();
		if (questions != null)
			if(questions.onclick2 != null)
				questions.onclick2();
	}
	
	public function show(pos:FlxPoint){
		bg.x = pos.x;
		bg.y = pos.y;
		
		txTitle.x = bg.x + 60;
		txTitle.y = bg.y + 45;
		
		txMsg.x = bg.x + 60;
		txMsg.y = txTitle.y + 80;
		
		btn1.x = bg.x + 60;
		btn1.y = bg.y + (bg.height - 55);
		
		btn2.x = bg.x + 170;
		btn2.y = bg.y + (bg.height - 55);
		
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
		
		FlxG.state.add(this);
	}
	
	public function close(){
		show(new FlxPoint( -1000, -1000));
		FlxG.state.remove(this);
	}
	
}