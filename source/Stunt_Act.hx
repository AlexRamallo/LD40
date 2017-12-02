package;

/**
 * ...
 * @author ...
 */
class Stunt_Act 
{
	public var id:Int;
	public var name(get, set):String;
	private var _name:String;
	
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
	
	public function get_name():String{
		return _name.toUpperCase();
	}
	
	public function set_name(s:String):String{
		_name = s;
		return _name;
	}
	
}