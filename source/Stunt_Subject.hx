package;

/**
 * ...
 * @author ...
 */
class Stunt_Subject 
{
	public var name(get, set):String;
	private var _name:String;
	
	public var delta_risk:Float;
	public var delta_danger:Int;
	public var delta_stupidity:Int;
	
	public var price:Int;
	
	public function new(n:String, r:Float, d:Int, s:Int, p:Int) {
		name = n;
		delta_risk = r;
		delta_danger = d;
		delta_stupidity = s;
		price = p;
	}
	
	public function get_name():String{
		return _name.toUpperCase();
	}
	
	public function set_name(s:String):String{
		_name = s;
		return _name;
	}
	
}