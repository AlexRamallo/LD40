package ;

/**
 * ...
 * @author ...
 */
class NameGenerator {

	public function new() {
		
	}
	
	public static var names = [
		"alex",
		"leo",
		"jonny",
		"sandra",
		"bob",
		"kiwi",
		"jenny",
		"bubba",
		"margaret",
		"olive",
		"tim",
		"mario",
		"lucy",
		"ellen",
		"andrew",
		"austin",
		"kevin",
		"ashley",
		"denice",
		"tionne",
		"lisa",
		"rozonda"
	];
	
	public static var words = [
		"electric",
		"groovy",
		"clairvoyant",
		"stubborn",
		"raging",
		"sleepy",
		"highaf",
		"creep",
		"enigmatic",
		"stalker",
		"teh",
		"penguin",
		"doom",
		"orthonormal",
		"salsaking",
		"salsaqueen",
		"foreign",
		"juggling",
		"singer"
	];
	
	public static var l337swaps = [
		"a" => "4",
		"l" => "1",
		"o" => "0",
		"e" => "3",
		"s" => "$",
	];
	
	private static inline function pick(a:Array<String>):String{
		return a[Math.floor(Math.random() * a.length)];
	}
	
	public static function generateName():String{
		var ret = "";
		var n = pick(names);
		var w = pick(words);
		var sep = "";
		
		if (Math.random() < 2 / 3){
			if (Math.random() < 0.5)
				sep = "-";
			else
				sep = "_";
		}else if (Math.random() < 0.5)
			sep = "";
			
		
		if (Math.random() < 0.5)
			ret = n + sep + w;
		else
			ret = w + sep + n;
		
		var nn = "";
		for (i in 0...ret.length){
			var c = ret.charAt(i);
			var sw:String = l337swaps.get(c);
			if (sw != null && Math.random() < 0.5)
				nn += Math.random()<0.7?sw:sw.toUpperCase();
			else
				nn += Math.random()<0.7?c:c.toUpperCase();
		}
		ret = nn;
		
		return ret;
	}
	
}