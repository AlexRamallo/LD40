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
	
	public var money:Int = 0;
	
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
		var followers_from_stunt = (50000 * (danger / 100)) + (50000 * risk);
		
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
		if (damage > 99)
			damage = 99;
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
					new Stunt_Subject("a habanero pepper",				5,		2,		2,			0),
					new Stunt_Subject("a ghost pepper",					5,		2,		4,			15),
					new Stunt_Subject("dog poop",						8,		5,		8,			100),
					new Stunt_Subject("a paperclip",					30,		15,		9,			30),
					new Stunt_Subject("an innocent frog",				30,		70,		9,			250),
					new Stunt_Subject("your neighbor",					85,		85,		9,			500)
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("surprise hug",							15,		10,		4,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("a stranger",						30,		15,		4,			0),
					new Stunt_Subject("a stray dog",					25,		40,		5,			0),
					new Stunt_Subject("a stray cat",					65,		40,		7,			0),
					new Stunt_Subject("a hobo",							35,		25,		6,			50),
					new Stunt_Subject("a trash panda",					50,		50,		6,			250),
					new Stunt_Subject("a bear",							70,		20,		7,			500),
					new Stunt_Subject("a cocaine bear",					90,		95,		9,			1000)
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("play",									10,		5,		0,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("video games",					1,		1,		0,			0),
					new Stunt_Subject("hide-n-seek",					10,		20,		2,			100),
					new Stunt_Subject("russian roulette",				16.6,	10,		3,			250),
					new Stunt_Subject("mumblety peg",					33.3,	20,		3,			500),
					new Stunt_Subject("in traffic",						60,		80,		8,			100),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("fall",									20,		30,		6,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("on a banana peel",				15,		8,		2,			100),
					new Stunt_Subject("from a moving car",				60,		5,		0,			0),
					new Stunt_Subject("for a scam",						50,		30,		3,			250),
					new Stunt_Subject("in love",						70,		60,		9,			500),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("chase",									20,		10,		9,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("a stranger down the street",		15,		30,		7,			100),
					new Stunt_Subject("waterfalls",						60,		5,		7,			0),
					new Stunt_Subject("a chocolate high",				10,		20,		3,			500),
					new Stunt_Subject("a slow tiger",					10,		60,		3,			250),
					new Stunt_Subject("a greasy tiger",					70,		80,		9,			250),
					new Stunt_Subject("your dreams",					0,		0,		0,			500),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("fight",									30,		20,		9,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("a mannequin",					5,		5,		9,			0),
					new Stunt_Subject("small animals",					6,		6,		9,			500),
					new Stunt_Subject("a birthday clown",				15,		15,		9,			100),
					new Stunt_Subject("a funeral clown",				40,		35,		9,			250),
					new Stunt_Subject("an alligator",					50,		65,		9,			500),
					new Stunt_Subject("a martial artist",				80,		80,		9,			500),
					new Stunt_Subject("two martial artists",			160,	160,	18,			500),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("prank",									5,		5,		3,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("your parents",					2,		5,		3,			500),
					new Stunt_Subject("a nigerian prince",				2,		2,		1,			100),
					new Stunt_Subject("your roommate",					5,		15,		2,			0),
					new Stunt_Subject("your neighbor",					15,		8,		2,			100),
					new Stunt_Subject("the police",						90,		94,		9,			250),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("run",									10,		10,		0,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("downhill",						15,		30,		5,			0),
					new Stunt_Subject("for governor",					45,		45,		3,			500),
					new Stunt_Subject("from the law",					65,		75,		2,			100),
					new Stunt_Subject("out of toilet paper",			99,		99,		11,			100),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("crush",									10,		1,		3,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("your own hopes and dreams",		1,		1,		9,			100),
					new Stunt_Subject("a soda can",						5,		5,		1,			0),
					new Stunt_Subject("a beer can",						10,		5,		1,			0),
					new Stunt_Subject("a watermelon",					10,		20,		3,			500),
					new Stunt_Subject("a stick of dynamite",			85,		97,		9,			100),
				]),
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("build",									3,		5,		0,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("a minecraft house",				5,		5,		2,			0),
					new Stunt_Subject("a dam in the sewers",			10,		20,		3,			500),
					new Stunt_Subject("castles in the sky",				25,		20,		2,			100),
					new Stunt_Subject("a secret clubhouse",				30,		25,		4,			500),
					new Stunt_Subject("the linux kernel",				75,		82,		9,			500),
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