package;
import Stunt_Act;
import Stunt_Subject;

/**
 * ...
 * @author Alejandro Ramallo
 */
class PlayData 
{
	public var name:String = "Kenny Rogers";
	
	public var health:Int = 100;
	public var followers:Int = 0;
	public var follower_data:Int = 0;
	
	public var money:Int = 5000;
	
	private var actlist:Array<Stunt_Act>;
	
	public var acts_unlocked:Int;
	public var subs_unlocked:Array<Int>;

	public function new() 
	{
		
	}
	
	//TODO: hardcode act data in here
	public function getAllActs():Array<Stunt_Act>{
		if(actlist == null){
			actlist = [
				//			  NAME,										RISK,	DANGER,	STUPIDITY,	PRICE
				new Stunt_Act("eat",									0,		2,		0,			0, [
					//				  NAME								%RISK	DANGER	STUPIDITY	PRICE
					new Stunt_Subject("a burger",						5,		2,		0,			0),
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
					new Stunt_Subject("a trash panda",					50,		60,		9,			2000),
					new Stunt_Subject("a bear",							80,		80,		10,			5000),
					new Stunt_Subject("a cocaine bear",					99,		99,		10,			10000),
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
				])
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