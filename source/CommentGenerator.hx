package ;

/**
 * ...
 * @author ...
 */
class CommentGenerator {

	public function new() {
		
	}
	
	public static var impressed = [
		"hahaha",
		"that was awesome!",
		"I wish I could do that",
		"Sick channel dude!",
		"Que impresionante!",
		"Good one!",
		"Totally tubular!",
		"I wonder how many tries that took!!",
		"lmaooooooooooo",
		"lmfao rotfl xDDDD !!!!11",
		"I CAN'T BELIEVE WHAT I JUST SAW",
		"DID THAT SERIOUSLY HAPPEN?!",
		"holyshit.gif"
	];
	
	public static var disliked = [
		"you suck",
		"boo",
		"yawn",
		"I could do better than that",
		"why am I watching this crap?",
		"I'm going to hunt you down and kill you for wasting my time",
		"What the fuck did you just fucking say about me, you little bitch? I’ll have you know I graduated top of my class in the Navy Sea..",
		"I'm unfollowing you because of this garbage",
		"Thanks for wasting my time",
		"This ruined my day",
		"asshole",
		"dick",
		"I hate you"
	];
	
	private static inline function pick(a:Array<String>):String{
		return a[Math.floor(Math.random() * a.length)];
	}
	
	public static function generateGoodComment():String{
		return pick(impressed);
	}
	public static function generateBadComment():String{
		return pick(disliked);
	}
	
}