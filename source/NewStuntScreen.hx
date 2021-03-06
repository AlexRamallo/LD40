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
		 txLabel.y = root.y + (40 * offset);
		 
		 btnEdit.x = txLabel.x + txLabel.fieldWidth + 5;
		 btnEdit.y = txLabel.y;
		 
		 var av = prog.shared.get('stunt_slots_active_$offset');
		 available = (av != null && av == true) || offset == 0;
		 
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
				'To add another act, you must invest an additional ${prog.data.cost_additional_stunt_slot}',
				function(){
					if(prog.data.money >= prog.data.cost_additional_stunt_slot){
						prog.data.money -= prog.data.cost_additional_stunt_slot;
						available = true;
						doLaunchSelectionFlow();
						prog.shared.set('stunt_slots_active_$offset', true);
					}else{
						prog.alert("Not enough money");
					}
				});
		 }else{
			 //Launch act selection dialog
			 doLaunchSelectionFlow();
		 }
	 }
	 
	 private function doLaunchSelectionFlow(){
		//Launch act selection dialog
		prog.shared.set('formsel_targ', {idx: offset});
		prog.openScreen(new FormScreen_SelectAct(prog));
	 }
	 
	 public function str():String{
		 if (pair == null)
			return 'ACT ${offset+1}: <nothing>';
			
		 return 'ACT ${offset+1}: ' + pair.act.name + " " + pair.sub.name;
	 }
	 
	 public function onDestroyMe(){
		 remove(btnEdit);
		 remove(txLabel);
		 FlxDestroyUtil.destroy(btnEdit);
		 FlxDestroyUtil.destroy(txLabel);
	 }
 }
 
class NewStuntScreen extends BaseScreen{
	
	public var txTitle:FlxText;
	public var txInstruct:FlxText;
	public var btnSubmit:FlxButton;
	public var actWidgets:Array<ActWidget>;
	
	public function new(p) 
	{
		super(p);
	}
	
	private function initUI(){
		txTitle = new FlxText();
		txInstruct = new FlxText();
		btnSubmit = new FlxButton(0, 0, "SUBMIT", onSubmit);
		
		txTitle.text = "DESCRIBE YOUR STUNT";
		txTitle.size = 24;
		txTitle.color = 0xFFFFFF;
		
		txInstruct.text = "Use \"ACTS\" to describe your stunt below.\nHit submit when you're done";
		txInstruct.size = 12;
		txInstruct.color = 0xFFFFFF;
		
		var root = new FlxPoint(0,0);
		actWidgets = [
			new ActWidget(prog, root, 0),
			new ActWidget(prog, root, 1),
			//new ActWidget(prog, root, 2)
		];
		actWidgets[0].available = true;
		
		for (w in actWidgets){
			w.init();
			add(w);
		}
		
		add(btnSubmit);
		add(txTitle);
		add(txInstruct);		
	}
	
	override public function setPos(x:Int, y:Int) {
		super.setPos(x, y);
		
		txTitle.x = banner.x + 30;
		txTitle.y = banner.y + 110;		
		 
		btnSubmit.x = banner.x + 475;
		btnSubmit.y = banner.y + 375;
		
		btnSubmit.scrollFactor.x = 1;
		btnSubmit.scrollFactor.y = 1;
		
		txInstruct.x = txTitle.x;
		txInstruct.y = txTitle.y + 30;
		txInstruct.fieldWidth = 450;
		
		var root = new FlxPoint(banner.x + 20, txInstruct.y + 100);
		for(w in actWidgets){
			w.root = root;
			w.updateUI();
		}
	}
	
	override public function onOpen():Void {
		show_banner2 = true;
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
	
	
	public function onSubmit(){
		var pairs = [];

		for (a in actWidgets)
			if(a.pair!=null)
				pairs.push(a.pair);
			
		if(pairs.length == 0){
			prog.alert("You must add at least 1 act before submitting the stunt");
			return;
		}

		var stunt:Stunt = new Stunt(pairs);
		
		var rating:Float = (stunt.getRisk() * stunt.getDanger()) / 100;
		
		var encouragement = [
			"Stunt successfully submitted.",
			"Good luck!",
			"Good luck (you're going to need it)",
			"Wow, that's cool!",
			"You're insane!",
			"Are you actually insane?",
			"What is wrong with you?!",
			"Get help. Seriously.",
			"I hope the attention is worth it.",
			"R.I.P.",
			"R.I.P. IN PEACE"
		];
		var eidx = Math.round(rating * (encouragement.length-1));
		var msg = encouragement[eidx];
		prog.data.submitStunt(stunt);
		
		prog.shared.set("form_results_active_stunt", stunt);
		
		for (i in 0...actWidgets.length){
			prog.shared.set('stunt_slots_active_$i', false);
			prog.shared.set('staged_act_$i', null);
			prog.shared.set('staged_subject_$i', null);
		}
		
		prog.openScreen(new StuntResultsScreen(prog));
		prog.alert(msg);
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
		remove(btnSubmit);
		for (w in actWidgets){
			w.onDestroyMe();
			remove(w);
			FlxDestroyUtil.destroy(w);
		}
	}
	
	override public function onStep(elapsed:Float):Void {
		super.onStep(elapsed);
	}
	
}