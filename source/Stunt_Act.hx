package;

/**
 * ...
 * @author ...
 */
class Stunt_Act 
{
	public var name:String;
	
	public var risk:Float;
	public var danger:Int;
	public var stupidity:Int;
	
	public var price:Int;
	
	public var subjects:Array<Stunt_Subject>;
	
	public function new(n:String, r:Float, d:Int, s:Int, p:Int, subs:Array<Stunt_Subject>) {
		name = n;
		risk = r;
		danger = d;
		stupidity = s;
		price = p;
		subjects = subs;
	}
	
}