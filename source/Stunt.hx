package;

/**
 * ...
 * @author ...
 */
class Stunt 
{
	public var risk:Float;
	public var danger:Int;
	public var stupidity:Int;
	
	public var result_accident:Bool = false;
	public var result_followers:Int = 0;
	public var result_damage:Int = 0;
	
	public var pairs:Array<{act:Stunt_Act, sub:Stunt_Subject}>;
	
	public function new(a) {
		pairs = a;
	}
	
	public function getRisk():Float{
		var ret:Float = 0;
		for(a in pairs)
			ret += a.act.risk + a.sub.delta_risk;
		ret /= 100;
		return ret>0?(ret>1?1:ret):0;
	}
	
	public function getDanger():Int{
		var ret = 0;
		for(a in pairs)
			ret += a.act.danger + a.sub.delta_danger;		
		return ret;
	}
	
	public function getStupidity():Int{
		var ret = 0;
		for(a in pairs)
			ret += a.act.stupidity + a.sub.delta_stupidity;
		return ret;
	}
	
	public function getName():String{
		var ret:String = "";
		var first:Bool = true;
		for (p in pairs){
			if(!first){
				ret += " while ";
				first = false;
			}
			ret += p.act.name + " " + p.sub.name;
		}
		return ret;
	}
}