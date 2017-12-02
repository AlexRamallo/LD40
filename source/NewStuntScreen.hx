package;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxDestroyUtil;
import flixel.group.FlxGroup;
/**
 * ...
 * @author Alejandro Ramallo
 */

 class ActWidget extends FlxGroup{
	 public var prog:PCProgram;
	 public var pair:{act:Stunt_Act, sub:Stunt_Subject};
	 
	 public var btnEdit:FlxButton;
	 public var txLabel:FlxText;
	 
	 public var offset:Int;
	 
	 public var available:Bool = false;
	 public var root:FlxPoint;
	 
	 public function new(p, rt:FlxPoint, off:Int){
		 super();
		 prog = p;
		 pair = null;
		 offset = off;
		 root = rt;
	 }
	 
	 public function setPair(act:Stunt_Act, sub:Stunt_Subject){
		pair = {
			act: act,
			sub: sub
		};
		updateUI();
	 }
	 
	 public function init(){
		btnEdit = new FlxButton(0, 0, "", onEdit);
		txLabel = new FlxText(0, 0, 300);
		
		txLabel.size = 12;
		txLabel.color = 0xFF4800;
		
		btnEdit.scrollFactor.x = 1;
		btnEdit.scrollFactor.y = 1;
		
		add(btnEdit);
		add(txLabel);
	 }
	 
	 public function updateUI(){
		 txLabel.text = str();
		 txLabel.x = root.x;
		 txLabel.y = root.y + (60 * offset);
		 
		 btnEdit.x = txLabel.x + txLabel.fieldWidth + 5;
		 btnEdit.y = txLabel.y;
		 
		 if(available){
			 btnEdit.text = "edit";
		 }else{
			 btnEdit.text = "purchase";
		 }
	 }
	 
	 public function onEdit(){
		 if(!available){
			 prog.confirm(
				"Purchase Slot?",
				"To add another act, you must invest an additional $5000",
				function(){
					//TODO:
					//reduce money
					//activate widget
				});
		 }else{
			 //Launch act selection dialog
			 prog.shared.set('formsel_targ', {idx: offset});
			 prog.openScreen(new FormScreen_SelectAct(prog));
		 }
	 }
	 
	 public function str():String{
		 if (pair == null)
			return "<nothing>";
			
		 return pair.act.name + " " + pair.sub.name;
	 }
 }
 
class NewStuntScreen extends BaseScreen{
	
	public var txTitle:FlxText;
	public var txInstruct:FlxText;
	
	public var actWidgets:Array<ActWidget>;
	
	public function new(p) 
	{
		super(p);
	}
	
	private function initUI(){
		txTitle = new FlxText();
		txInstruct = new FlxText();
		
		txTitle.text = "Post New Stunt";
		txTitle.size = 16;
		txTitle.color = 0xFF4800;
		
		txInstruct.text = "edit the acts you want to perform below";
		txInstruct.size = 12;
		txInstruct.color = 0xFF4800;
		
		var root = new FlxPoint(0,0);
		actWidgets = [
			new ActWidget(prog, root, 0),
			new ActWidget(prog, root, 1),
			new ActWidget(prog, root, 2)
		];
		actWidgets[0].available = true;
		
		for (w in actWidgets){
			w.init();
			add(w);
		}
		
		add(txTitle);
		add(txInstruct);		
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
		
		txTitle.x = banner.x + 30;
		txTitle.y = banner.y + 110;
		
		txInstruct.x = txTitle.x;
		txInstruct.y = txTitle.y + 30;
		
		var root = new FlxPoint(banner.x + 20, txInstruct.y + 50);
		for(w in actWidgets){
			w.root = root;
			w.updateUI();
		}
	}
	
	override public function onOpen():Void {
		super.onOpen();
		initUI();
		
		var formsel_targ:{idx:Int} = prog.shared.get("formsel_targ");
		var formsel_Act:Stunt_Act = prog.shared.get("formsel_Act");
		var formsel_Sub:Stunt_Subject = prog.shared.get("formsel_Subject");
		
		if(formsel_Act!=null && formsel_Sub!=null && formsel_targ!=null){
			prog.shared.set('staged_act_${formsel_targ.idx}', formsel_Act);
			prog.shared.set('staged_subject_${formsel_targ.idx}', formsel_Sub);
			
			prog.shared.set('formsel_targ', null);
			prog.shared.set('formsel_Act', null);
			prog.shared.set('formsel_Subject', null);
		}
		
		loadStagedStunts();
	}
	
	private function loadStagedStunts(){
		for(i in 0...actWidgets.length){
			var sAct:Stunt_Act = prog.shared.get('staged_act_$i');
			var sSub:Stunt_Subject = prog.shared.get('staged_subject_$i');

			if(sAct!=null && sSub!=null)
				actWidgets[i].setPair(sAct, sSub);
		}
	}
	
	override public function onClose():Void {
		super.onClose();
		remove(txTitle);
		remove(txInstruct);
		for (w in actWidgets)
			remove(w);
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
	}
	
}