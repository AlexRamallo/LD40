package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/avatar.png", "assets/images/avatar.png");
			type.set ("assets/images/avatar.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg1.png", "assets/images/avatars/bg1.png");
			type.set ("assets/images/avatars/bg1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg10.png", "assets/images/avatars/bg10.png");
			type.set ("assets/images/avatars/bg10.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg2.png", "assets/images/avatars/bg2.png");
			type.set ("assets/images/avatars/bg2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg3.png", "assets/images/avatars/bg3.png");
			type.set ("assets/images/avatars/bg3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg4.png", "assets/images/avatars/bg4.png");
			type.set ("assets/images/avatars/bg4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg5.png", "assets/images/avatars/bg5.png");
			type.set ("assets/images/avatars/bg5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg6.png", "assets/images/avatars/bg6.png");
			type.set ("assets/images/avatars/bg6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg7.png", "assets/images/avatars/bg7.png");
			type.set ("assets/images/avatars/bg7.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg8.png", "assets/images/avatars/bg8.png");
			type.set ("assets/images/avatars/bg8.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/bg9.png", "assets/images/avatars/bg9.png");
			type.set ("assets/images/avatars/bg9.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg1.png", "assets/images/avatars/fg1.png");
			type.set ("assets/images/avatars/fg1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg10.png", "assets/images/avatars/fg10.png");
			type.set ("assets/images/avatars/fg10.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg2.png", "assets/images/avatars/fg2.png");
			type.set ("assets/images/avatars/fg2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg3.png", "assets/images/avatars/fg3.png");
			type.set ("assets/images/avatars/fg3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg4.png", "assets/images/avatars/fg4.png");
			type.set ("assets/images/avatars/fg4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg5.png", "assets/images/avatars/fg5.png");
			type.set ("assets/images/avatars/fg5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg6.png", "assets/images/avatars/fg6.png");
			type.set ("assets/images/avatars/fg6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg7.png", "assets/images/avatars/fg7.png");
			type.set ("assets/images/avatars/fg7.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg8.png", "assets/images/avatars/fg8.png");
			type.set ("assets/images/avatars/fg8.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fg9.png", "assets/images/avatars/fg9.png");
			type.set ("assets/images/avatars/fg9.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fr1.png", "assets/images/avatars/fr1.png");
			type.set ("assets/images/avatars/fr1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fr2.png", "assets/images/avatars/fr2.png");
			type.set ("assets/images/avatars/fr2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fr3.png", "assets/images/avatars/fr3.png");
			type.set ("assets/images/avatars/fr3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fr4.png", "assets/images/avatars/fr4.png");
			type.set ("assets/images/avatars/fr4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fr5.png", "assets/images/avatars/fr5.png");
			type.set ("assets/images/avatars/fr5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/avatars/fr6.png", "assets/images/avatars/fr6.png");
			type.set ("assets/images/avatars/fr6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/banner.png", "assets/images/banner.png");
			type.set ("assets/images/banner.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bg_test.png", "assets/images/bg_test.png");
			type.set ("assets/images/bg_test.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/desk.png", "assets/images/desk.png");
			type.set ("assets/images/desk.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/graveyard.png", "assets/images/graveyard.png");
			type.set ("assets/images/graveyard.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hospital.png", "assets/images/hospital.png");
			type.set ("assets/images/hospital.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/pc1.png", "assets/images/pc1.png");
			type.set ("assets/images/pc1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pc2.png", "assets/images/pc2.png");
			type.set ("assets/images/pc2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/popup.png", "assets/images/popup.png");
			type.set ("assets/images/popup.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/stats.png", "assets/images/stats.png");
			type.set ("assets/images/stats.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
