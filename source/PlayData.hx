package;
import Stunt_Act;
import Stunt_Subject;
import flixel.FlxG;
/**
 * ...
 * @author Alejandro Ramallo
 */
class PlayData 
{
	//GENERAL PRICES
	public var cost_additional_stunt_slot:Int 	= 5000;
	public var cost_unlock_act:Int 				= 5000;
	public var cost_unlock_subject:Int 			= 1000;
	public var cost_painkillers 				= 3000;
	public var cost_painkillers2 				= 6000;
	//////////////////////////////
	
	//OTC drugs
	public var painkiller_recovery:Int = 100;
	public var painkiller_tolerance:Float = 1;
	public var painkiller_tolerance_rate:Float = 1.25;
	
	//Hospital drugs
	public var painkiller2_recovery:Int = 100;
	public var painkiller2_tolerance:Float = 1;
	public var painkiller2_tolerance_rate:Float = 1.1;
	
	public var prog:PCProgram;
	public var view:GameView;
	
	public var name:String = "Kenny Rogers";
	public var avatar:UserAvatar = null;
	
	public var health:Int = 100;
	public var followers:Int = 0;
	public var follower_data:Int = 0;
	
	public var memory:Int = 5; //memory of your viewers
	
	public var money:Int = 50000;
	
	public var stunt_history:Array<Stunt> = [];
	
	private var actlist:Array<Stunt_Act>;	
	public var acts_unlocked:Int;
	public var subs_unlocked:Array<Int>;
	
	public var prev_risk:Array<Float> = [];
	public var prev_danger:Array<Int> = [];
	
	public var dumb_luck:Float = 0;

	public function new(p) 
	{
		prog = p;
		avatar = new UserAvatar();
		avatar.initRandom();
		name = NameGenerator.generateName();
		
		/////////// DEBUGGING
		FlxG.log.redirectTraces = true;
		FlxG.watch.add(this, "dumb_luck", "dumb luck");
		FlxG.watch.add(this, "memory", "viewer memory");
		FlxG.watch.add(this, "prev_risk", "p.Risk");
		FlxG.watch.add(this, "prev_danger", "p.Danger");
		/////////////////////
	}
	
	public function submitStunt(stunt:Stunt){
		
		var lastStunt = stunt_history[stunt_history.length - 1];
		if (lastStunt == null)
			lastStunt = new Stunt([]);
		
		//Calculate results here
		var risk = stunt.getRisk();			//Likelihood of an accident
		var danger = stunt.getDanger();		//Damage to health from accident
		var stupid = stunt.getStupidity();	//Stupidness rating from 0-9 (special modifier)
		
		prev_risk.push(risk);
		prev_danger.push(danger);
		
		var net_risk = risk - lastStunt.getRisk();
		var net_danger = risk - lastStunt.getDanger();
		//calculate: increase or loss in followers
		
		//Dumb luck decreases risk
		risk -= dumb_luck;
		if (risk < 0)
			risk = 0;
		dumb_luck *= 0.9;
		
		var accident:Bool = Math.random() <= risk;
		
		var damage = 0;
		/*
		 * Stupidity modifier works as follows:
		 * 	- If you avoid an accident in a high-risk stunt, you get a [stupidity bonus]
		 * 		- if not, then your dumb luck is reset
		 *  - If you have an accident in a low-risk stunt, you get a [stupidity bonus]
		 * 
		 * Stupidity bonus is a bonus of extra followers
		 * If stupidity bonus is achieved, and stupidity level is greater
		 * than 5, then the `memory` stat will decrease by 1
		 * 
		 * If stupidity bonus is not achieved, and stupidity is greater than
		 * 5, then the `memory` stat will increase by 1
		 * 
		 * min memory stat: 2
		 * max memory stat: 5
		 * 
		 * [stupidity bonus] = 1000 * [stupidity level]
		 * */
		var stupidity_bonus = 0;
		if (accident){
			damage = danger;
			if (risk < 0.5)
				stupidity_bonus = 1000 * stupid;
			else
				dumb_luck = 0;
		}else{
			if (risk > 0.5)
				stupidity_bonus = 1000 * stupid;
		}
		
		if(stupid > 5){
			if(stupidity_bonus != 0){
				memory--;
				if (memory < 2) memory = 2;
			}else{
				memory++;
				if (memory > 10) memory = 10;
			}
		}
		
		//Followers gained from the stunt
		var followers_from_stunt = (250000 * (danger / 100)) + (250000 * risk);
		
		/*var loss_from_boredom = 0;
		if(net_risk <= 0 && net_danger <= 0){
			loss_from_boredom = Std.int(
				(net_risk * followers_from_outcome)
				+
				(net_danger * followers_from_stunt)
			);
		}*/
		
		var loss_from_recent = 0;
		var loss_from_repeat = 1;
		for(i in 0...stunt_history.length){
			var pst = stunt_history[(stunt_history.length - 1) - i];
			var match = false;			
			if(pst!=null)
				match = pst.getName() == stunt.getName();
				
			if(i < memory && match)
				loss_from_recent += 1;
				
			if (match)
				loss_from_repeat += 1;
		}
		
		stunt.result_accident = accident;
		stunt.result_followers = Std.int(
			  (followers_from_stunt / loss_from_repeat) + stupidity_bonus
			- (loss_from_recent * followers_from_stunt)
		);
		
		stunt.result_damage = damage;
		stunt_history.push(stunt);
		giveRewards(stunt);
	}
	
	public function submitStunt2(stunt:Stunt){		
		var avg_risk:Float = 0;
		var avg_danger:Int = 0;
		
		var risk_memory_sum:Float = 0;
		for (r in prev_risk)
			risk_memory_sum += r;
		avg_risk = risk_memory_sum / memory;
		
		var danger_memory_sum:Float = 0;
		for (d in prev_danger)
			danger_memory_sum += d;
		avg_danger = Std.int(danger_memory_sum / memory);
		
		//Calculate results here
		var risk = stunt.getRisk();			//Likelihood of an accident
		var danger = stunt.getDanger();		//Damage to health from accident
		var stupid = stunt.getStupidity();	//Stupidness rating from 0-9 (special modifier)
		
		prev_risk.push(risk);
		prev_danger.push(danger);
		
		var net_risk = risk - avg_risk;
		var net_danger = risk - avg_danger;
		//calculate: increase or loss in followers
		
		//Dumb luck decreases risk
		risk -= dumb_luck;
		if (risk < 0)
			risk = 0;
		dumb_luck *= 0.9;
		
		var accident:Bool = Math.random() <= risk;
		
		var damage = 0;
		/*
		 * Stupidity modifier works as follows:
		 * 	- If you avoid an accident in a high-risk stunt, you get a [stupidity bonus]
		 * 		- if not, then your dumb luck is reset
		 *  - If you have an accident in a low-risk stunt, you get a [stupidity bonus]
		 * 
		 * Stupidity bonus is a bonus of extra followers
		 * If stupidity bonus is achieved, and stupidity level is greater
		 * than 5, then the `memory` stat will decrease by 1
		 * 
		 * If stupidity bonus is not achieved, and stupidity is greater than
		 * 5, then the `memory` stat will increase by 1
		 * 
		 * min memory stat: 2
		 * max memory stat: 5
		 * 
		 * [stupidity bonus] = 1000 * [stupidity level]
		 * */
		var stupidity_bonus = 0;
		if (accident){
			damage = danger;
			if (risk < 0.5)
				stupidity_bonus = 1000 * stupid;
			else
				dumb_luck = 0;
		}else{
			if (risk > 0.5)
				stupidity_bonus = 1000 * stupid;
		}
		
		if(stupid > 5){
			if(stupidity_bonus != 0){
				memory--;
				if (memory < 2) memory = 2;
			}else{
				memory++;
				if (memory > 10) memory = 10;
			}
		}
		
		//Followers gained from the stunt
		var followers_from_stunt = net_danger>=0?(15000 * (danger / 100)):0;
		var followers_from_outcome = net_risk>=0?((15000 / (1 - risk)) / (accident?2:1)):0;
		
		var loss_from_boredom = 0;
		if(net_risk <= 0 && net_danger <= 0){
			loss_from_boredom = Std.int(
				(net_risk * followers_from_outcome)
				+
				(net_danger * followers_from_stunt)
			);
		}
		
		var last_stunt = stunt_history[stunt_history.length];
		var loss_from_repetition = 0;
		if(last_stunt!=null){
			if (last_stunt.getName() == stunt.getName())
				loss_from_repetition = Std.int((followers_from_stunt + followers_from_outcome) / 2);
		}
		
		stunt.result_accident = accident;
		stunt.result_followers = Std.int(
			  followers_from_stunt + followers_from_outcome + stupidity_bonus
			- (loss_from_boredom + loss_from_repetition)
		);
		
		stunt.result_damage = damage;
		stunt_history.push(stunt);
		giveRewards(stunt);
	}
	
	public function giveRewards(stunt:Stunt){
		followers += stunt.result_followers;
		follower_data += stunt.result_followers;
		health -= stunt.result_damage;
		
		if(health <= 0){
			view.died();
			prog.died();
			prog.alert("You're dead :'(", "Guess what?");
		}
	}
	
	//TODO: hardcode act data in here
	public function getAllActs():Array<Stunt_Act>{
		if(actlist == null){
			actlist = [
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("eat",									0,		2,		0,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("a burger",						1,		2,		0,			0),
					new Stunt_Subject("some yogurt",					5,		2,		0,			0),
					new Stunt_Subject("a condiment sundae",				20,		5,		2,			15),
					new Stunt_Subject("some cinnamon",					25,		2,		3,			30),
					new Stunt_Subject("a habanero pepper",				35,		8,		5,			100),
					new Stunt_Subject("a ghost pepper",					50,		15,		7,			250),
					new Stunt_Subject("a carolina reaper pepper",		55,		15,		9,			500)
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("surprise hug",							5,		5,		0,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("your friend",					0,		0,		0,			0),
					new Stunt_Subject("your mom",						-100,	-100,	0,			0),
					new Stunt_Subject("your coworker",					10,		2,		3,			50),
					new Stunt_Subject("your boss",						40,		20,		5,			75),
					new Stunt_Subject("a stranger",						50,		25,		6,			250),
					new Stunt_Subject("a hobo",							70,		20,		7,			500),
					new Stunt_Subject("a stray dog",					20,		40,		8,			1000),
					new Stunt_Subject("a stray cat",					60,		40,		8,			1200),
					new Stunt_Subject("a trash panda",					50,		60,		8,			2000),
					new Stunt_Subject("a bear",							80,		80,		9,			5000),
					new Stunt_Subject("a cocaine bear",					99,		99,		9,			10000),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("race",									10,		10,		0,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("on foot",						5,		5,		0,			0),
					new Stunt_Subject("on a bike",						15,		8,		2,			100),
					new Stunt_Subject("on a moped",						20,		10,		3,			250),
					new Stunt_Subject("go karts",						10,		20,		3,			500),
					new Stunt_Subject("in a car",						35,		70,		8,			1000),
					new Stunt_Subject("airplanes",						75,		99,		9,			5000),
				]),
				////////////////////
			];
			
			acts_unlocked = 0;
			subs_unlocked = [];
			for(i in 0...actlist.length){
				subs_unlocked.push(0);
				actlist[i].id = i;
			}
				
		}
		
		return actlist;
	}
}