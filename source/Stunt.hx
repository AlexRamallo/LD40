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
	
	public var pairs:Array<{act:Stunt_Act, sub:Stunt_Subject}>;
	
	public function new(a) {
		acts = a;
	}
	
	public function getRisk():Float{
		var ret = 0;
		for(a in acts)
			ret += a.act.risk + a.sub.delta_risk;
		return ret>0?ret:0;
	}
	
	public function getDanger():Int{
		var ret = 0;
		for(a in acts)
			ret += a.act.danger + a.sub.delta_danger;		
		return ret;
	}
	
	public function getStupidity():Int{
		var ret = 0;
		for(a in acts)
			ret += a.act.stupidity + a.sub.delta_stupidity;
		return ret;
	}
}