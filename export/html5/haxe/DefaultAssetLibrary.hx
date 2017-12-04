package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/images/avatar.png", __ASSET__assets_images_avatar_png);
		type.set ("assets/images/avatar.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg1.png", __ASSET__assets_images_avatars_bg1_png);
		type.set ("assets/images/avatars/bg1.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg10.png", __ASSET__assets_images_avatars_bg10_png);
		type.set ("assets/images/avatars/bg10.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg2.png", __ASSET__assets_images_avatars_bg2_png);
		type.set ("assets/images/avatars/bg2.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg3.png", __ASSET__assets_images_avatars_bg3_png);
		type.set ("assets/images/avatars/bg3.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg4.png", __ASSET__assets_images_avatars_bg4_png);
		type.set ("assets/images/avatars/bg4.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg5.png", __ASSET__assets_images_avatars_bg5_png);
		type.set ("assets/images/avatars/bg5.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg6.png", __ASSET__assets_images_avatars_bg6_png);
		type.set ("assets/images/avatars/bg6.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg7.png", __ASSET__assets_images_avatars_bg7_png);
		type.set ("assets/images/avatars/bg7.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg8.png", __ASSET__assets_images_avatars_bg8_png);
		type.set ("assets/images/avatars/bg8.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/bg9.png", __ASSET__assets_images_avatars_bg9_png);
		type.set ("assets/images/avatars/bg9.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg1.png", __ASSET__assets_images_avatars_fg1_png);
		type.set ("assets/images/avatars/fg1.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg10.png", __ASSET__assets_images_avatars_fg10_png);
		type.set ("assets/images/avatars/fg10.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg2.png", __ASSET__assets_images_avatars_fg2_png);
		type.set ("assets/images/avatars/fg2.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg3.png", __ASSET__assets_images_avatars_fg3_png);
		type.set ("assets/images/avatars/fg3.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg4.png", __ASSET__assets_images_avatars_fg4_png);
		type.set ("assets/images/avatars/fg4.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg5.png", __ASSET__assets_images_avatars_fg5_png);
		type.set ("assets/images/avatars/fg5.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg6.png", __ASSET__assets_images_avatars_fg6_png);
		type.set ("assets/images/avatars/fg6.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg7.png", __ASSET__assets_images_avatars_fg7_png);
		type.set ("assets/images/avatars/fg7.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg8.png", __ASSET__assets_images_avatars_fg8_png);
		type.set ("assets/images/avatars/fg8.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fg9.png", __ASSET__assets_images_avatars_fg9_png);
		type.set ("assets/images/avatars/fg9.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fr1.png", __ASSET__assets_images_avatars_fr1_png);
		type.set ("assets/images/avatars/fr1.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fr2.png", __ASSET__assets_images_avatars_fr2_png);
		type.set ("assets/images/avatars/fr2.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fr3.png", __ASSET__assets_images_avatars_fr3_png);
		type.set ("assets/images/avatars/fr3.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fr4.png", __ASSET__assets_images_avatars_fr4_png);
		type.set ("assets/images/avatars/fr4.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fr5.png", __ASSET__assets_images_avatars_fr5_png);
		type.set ("assets/images/avatars/fr5.png", AssetType.IMAGE);
		className.set ("assets/images/avatars/fr6.png", __ASSET__assets_images_avatars_fr6_png);
		type.set ("assets/images/avatars/fr6.png", AssetType.IMAGE);
		className.set ("assets/images/banner.png", __ASSET__assets_images_banner_png);
		type.set ("assets/images/banner.png", AssetType.IMAGE);
		className.set ("assets/images/banner2.png", __ASSET__assets_images_banner2_png);
		type.set ("assets/images/banner2.png", AssetType.IMAGE);
		className.set ("assets/images/comment_back.png", __ASSET__assets_images_comment_back_png);
		type.set ("assets/images/comment_back.png", AssetType.IMAGE);
		className.set ("assets/images/desk.png", __ASSET__assets_images_desk_png);
		type.set ("assets/images/desk.png", AssetType.IMAGE);
		className.set ("assets/images/graveyard.png", __ASSET__assets_images_graveyard_png);
		type.set ("assets/images/graveyard.png", AssetType.IMAGE);
		className.set ("assets/images/hospital.png", __ASSET__assets_images_hospital_png);
		type.set ("assets/images/hospital.png", AssetType.IMAGE);
		className.set ("assets/images/injured.png", __ASSET__assets_images_injured_png);
		type.set ("assets/images/injured.png", AssetType.IMAGE);
		className.set ("assets/images/keys1.png", __ASSET__assets_images_keys1_png);
		type.set ("assets/images/keys1.png", AssetType.IMAGE);
		className.set ("assets/images/keys2.png", __ASSET__assets_images_keys2_png);
		type.set ("assets/images/keys2.png", AssetType.IMAGE);
		className.set ("assets/images/merchant_back.png", __ASSET__assets_images_merchant_back_png);
		type.set ("assets/images/merchant_back.png", AssetType.IMAGE);
		className.set ("assets/images/painkillers.png", __ASSET__assets_images_painkillers_png);
		type.set ("assets/images/painkillers.png", AssetType.IMAGE);
		className.set ("assets/images/painkillers_otc.png", __ASSET__assets_images_painkillers_otc_png);
		type.set ("assets/images/painkillers_otc.png", AssetType.IMAGE);
		className.set ("assets/images/popup.png", __ASSET__assets_images_popup_png);
		type.set ("assets/images/popup.png", AssetType.IMAGE);
		className.set ("assets/images/stats.png", __ASSET__assets_images_stats_png);
		type.set ("assets/images/stats.png", AssetType.IMAGE);
		className.set ("assets/images/thumbs_14x14.png", __ASSET__assets_images_thumbs_14x14_png);
		type.set ("assets/images/thumbs_14x14.png", AssetType.IMAGE);
		className.set ("assets/images/transition.png", __ASSET__assets_images_transition_png);
		type.set ("assets/images/transition.png", AssetType.IMAGE);
		className.set ("assets/music/go_back.wav", __ASSET__assets_music_go_back_wav);
		type.set ("assets/music/go_back.wav", AssetType.SOUND);
		className.set ("assets/music/go_home.wav", __ASSET__assets_music_go_home_wav);
		type.set ("assets/music/go_home.wav", AssetType.SOUND);
		className.set ("assets/music/injured.wav", __ASSET__assets_music_injured_wav);
		type.set ("assets/music/injured.wav", AssetType.SOUND);
		className.set ("assets/music/open_page.wav", __ASSET__assets_music_open_page_wav);
		type.set ("assets/music/open_page.wav", AssetType.SOUND);
		className.set ("assets/music/sold_data.wav", __ASSET__assets_music_sold_data_wav);
		type.set ("assets/music/sold_data.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/avatar.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/bg9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fg9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fr1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fr2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fr3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fr4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fr5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/avatars/fr6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/banner.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/banner2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/comment_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/desk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/graveyard.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hospital.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/injured.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/merchant_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/painkillers.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/painkillers_otc.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/popup.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/stats.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/thumbs_14x14.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/transition.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/go_back.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/go_home.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/injured.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/open_page.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/sold_data.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/avatar.png", __ASSET__assets_images_avatar_png);
		type.set ("assets/images/avatar.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg1.png", __ASSET__assets_images_avatars_bg1_png);
		type.set ("assets/images/avatars/bg1.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg10.png", __ASSET__assets_images_avatars_bg10_png);
		type.set ("assets/images/avatars/bg10.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg2.png", __ASSET__assets_images_avatars_bg2_png);
		type.set ("assets/images/avatars/bg2.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg3.png", __ASSET__assets_images_avatars_bg3_png);
		type.set ("assets/images/avatars/bg3.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg4.png", __ASSET__assets_images_avatars_bg4_png);
		type.set ("assets/images/avatars/bg4.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg5.png", __ASSET__assets_images_avatars_bg5_png);
		type.set ("assets/images/avatars/bg5.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg6.png", __ASSET__assets_images_avatars_bg6_png);
		type.set ("assets/images/avatars/bg6.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg7.png", __ASSET__assets_images_avatars_bg7_png);
		type.set ("assets/images/avatars/bg7.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg8.png", __ASSET__assets_images_avatars_bg8_png);
		type.set ("assets/images/avatars/bg8.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/bg9.png", __ASSET__assets_images_avatars_bg9_png);
		type.set ("assets/images/avatars/bg9.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg1.png", __ASSET__assets_images_avatars_fg1_png);
		type.set ("assets/images/avatars/fg1.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg10.png", __ASSET__assets_images_avatars_fg10_png);
		type.set ("assets/images/avatars/fg10.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg2.png", __ASSET__assets_images_avatars_fg2_png);
		type.set ("assets/images/avatars/fg2.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg3.png", __ASSET__assets_images_avatars_fg3_png);
		type.set ("assets/images/avatars/fg3.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg4.png", __ASSET__assets_images_avatars_fg4_png);
		type.set ("assets/images/avatars/fg4.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg5.png", __ASSET__assets_images_avatars_fg5_png);
		type.set ("assets/images/avatars/fg5.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg6.png", __ASSET__assets_images_avatars_fg6_png);
		type.set ("assets/images/avatars/fg6.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg7.png", __ASSET__assets_images_avatars_fg7_png);
		type.set ("assets/images/avatars/fg7.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg8.png", __ASSET__assets_images_avatars_fg8_png);
		type.set ("assets/images/avatars/fg8.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fg9.png", __ASSET__assets_images_avatars_fg9_png);
		type.set ("assets/images/avatars/fg9.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fr1.png", __ASSET__assets_images_avatars_fr1_png);
		type.set ("assets/images/avatars/fr1.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fr2.png", __ASSET__assets_images_avatars_fr2_png);
		type.set ("assets/images/avatars/fr2.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fr3.png", __ASSET__assets_images_avatars_fr3_png);
		type.set ("assets/images/avatars/fr3.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fr4.png", __ASSET__assets_images_avatars_fr4_png);
		type.set ("assets/images/avatars/fr4.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fr5.png", __ASSET__assets_images_avatars_fr5_png);
		type.set ("assets/images/avatars/fr5.png", AssetType.IMAGE);
		
		className.set ("assets/images/avatars/fr6.png", __ASSET__assets_images_avatars_fr6_png);
		type.set ("assets/images/avatars/fr6.png", AssetType.IMAGE);
		
		className.set ("assets/images/banner.png", __ASSET__assets_images_banner_png);
		type.set ("assets/images/banner.png", AssetType.IMAGE);
		
		className.set ("assets/images/banner2.png", __ASSET__assets_images_banner2_png);
		type.set ("assets/images/banner2.png", AssetType.IMAGE);
		
		className.set ("assets/images/comment_back.png", __ASSET__assets_images_comment_back_png);
		type.set ("assets/images/comment_back.png", AssetType.IMAGE);
		
		className.set ("assets/images/desk.png", __ASSET__assets_images_desk_png);
		type.set ("assets/images/desk.png", AssetType.IMAGE);
		
		className.set ("assets/images/graveyard.png", __ASSET__assets_images_graveyard_png);
		type.set ("assets/images/graveyard.png", AssetType.IMAGE);
		
		className.set ("assets/images/hospital.png", __ASSET__assets_images_hospital_png);
		type.set ("assets/images/hospital.png", AssetType.IMAGE);
		
		className.set ("assets/images/injured.png", __ASSET__assets_images_injured_png);
		type.set ("assets/images/injured.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys1.png", __ASSET__assets_images_keys1_png);
		type.set ("assets/images/keys1.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys2.png", __ASSET__assets_images_keys2_png);
		type.set ("assets/images/keys2.png", AssetType.IMAGE);
		
		className.set ("assets/images/merchant_back.png", __ASSET__assets_images_merchant_back_png);
		type.set ("assets/images/merchant_back.png", AssetType.IMAGE);
		
		className.set ("assets/images/painkillers.png", __ASSET__assets_images_painkillers_png);
		type.set ("assets/images/painkillers.png", AssetType.IMAGE);
		
		className.set ("assets/images/painkillers_otc.png", __ASSET__assets_images_painkillers_otc_png);
		type.set ("assets/images/painkillers_otc.png", AssetType.IMAGE);
		
		className.set ("assets/images/popup.png", __ASSET__assets_images_popup_png);
		type.set ("assets/images/popup.png", AssetType.IMAGE);
		
		className.set ("assets/images/stats.png", __ASSET__assets_images_stats_png);
		type.set ("assets/images/stats.png", AssetType.IMAGE);
		
		className.set ("assets/images/thumbs_14x14.png", __ASSET__assets_images_thumbs_14x14_png);
		type.set ("assets/images/thumbs_14x14.png", AssetType.IMAGE);
		
		className.set ("assets/images/transition.png", __ASSET__assets_images_transition_png);
		type.set ("assets/images/transition.png", AssetType.IMAGE);
		
		className.set ("assets/music/go_back.wav", __ASSET__assets_music_go_back_wav);
		type.set ("assets/music/go_back.wav", AssetType.SOUND);
		
		className.set ("assets/music/go_home.wav", __ASSET__assets_music_go_home_wav);
		type.set ("assets/music/go_home.wav", AssetType.SOUND);
		
		className.set ("assets/music/injured.wav", __ASSET__assets_music_injured_wav);
		type.set ("assets/music/injured.wav", AssetType.SOUND);
		
		className.set ("assets/music/open_page.wav", __ASSET__assets_music_open_page_wav);
		type.set ("assets/music/open_page.wav", AssetType.SOUND);
		
		className.set ("assets/music/sold_data.wav", __ASSET__assets_music_sold_data_wav);
		type.set ("assets/music/sold_data.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_bg9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fg9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fr1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fr2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fr3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fr4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fr5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_avatars_fr6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_banner_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_banner2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_comment_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_desk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_graveyard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hospital_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_injured_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_merchant_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_painkillers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_painkillers_otc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_popup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stats_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_thumbs_14x14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_transition_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_go_back_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_go_home_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_injured_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_open_page_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_sold_data_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5





















































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:image("assets/images/avatar.png") #if display private #end class __ASSET__assets_images_avatar_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg1.png") #if display private #end class __ASSET__assets_images_avatars_bg1_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg10.png") #if display private #end class __ASSET__assets_images_avatars_bg10_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg2.png") #if display private #end class __ASSET__assets_images_avatars_bg2_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg3.png") #if display private #end class __ASSET__assets_images_avatars_bg3_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg4.png") #if display private #end class __ASSET__assets_images_avatars_bg4_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg5.png") #if display private #end class __ASSET__assets_images_avatars_bg5_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg6.png") #if display private #end class __ASSET__assets_images_avatars_bg6_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg7.png") #if display private #end class __ASSET__assets_images_avatars_bg7_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg8.png") #if display private #end class __ASSET__assets_images_avatars_bg8_png extends lime.graphics.Image {}
@:image("assets/images/avatars/bg9.png") #if display private #end class __ASSET__assets_images_avatars_bg9_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg1.png") #if display private #end class __ASSET__assets_images_avatars_fg1_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg10.png") #if display private #end class __ASSET__assets_images_avatars_fg10_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg2.png") #if display private #end class __ASSET__assets_images_avatars_fg2_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg3.png") #if display private #end class __ASSET__assets_images_avatars_fg3_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg4.png") #if display private #end class __ASSET__assets_images_avatars_fg4_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg5.png") #if display private #end class __ASSET__assets_images_avatars_fg5_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg6.png") #if display private #end class __ASSET__assets_images_avatars_fg6_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg7.png") #if display private #end class __ASSET__assets_images_avatars_fg7_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg8.png") #if display private #end class __ASSET__assets_images_avatars_fg8_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fg9.png") #if display private #end class __ASSET__assets_images_avatars_fg9_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fr1.png") #if display private #end class __ASSET__assets_images_avatars_fr1_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fr2.png") #if display private #end class __ASSET__assets_images_avatars_fr2_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fr3.png") #if display private #end class __ASSET__assets_images_avatars_fr3_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fr4.png") #if display private #end class __ASSET__assets_images_avatars_fr4_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fr5.png") #if display private #end class __ASSET__assets_images_avatars_fr5_png extends lime.graphics.Image {}
@:image("assets/images/avatars/fr6.png") #if display private #end class __ASSET__assets_images_avatars_fr6_png extends lime.graphics.Image {}
@:image("assets/images/banner.png") #if display private #end class __ASSET__assets_images_banner_png extends lime.graphics.Image {}
@:image("assets/images/banner2.png") #if display private #end class __ASSET__assets_images_banner2_png extends lime.graphics.Image {}
@:image("assets/images/comment_back.png") #if display private #end class __ASSET__assets_images_comment_back_png extends lime.graphics.Image {}
@:image("assets/images/desk.png") #if display private #end class __ASSET__assets_images_desk_png extends lime.graphics.Image {}
@:image("assets/images/graveyard.png") #if display private #end class __ASSET__assets_images_graveyard_png extends lime.graphics.Image {}
@:image("assets/images/hospital.png") #if display private #end class __ASSET__assets_images_hospital_png extends lime.graphics.Image {}
@:image("assets/images/injured.png") #if display private #end class __ASSET__assets_images_injured_png extends lime.graphics.Image {}
@:image("assets/images/keys1.png") #if display private #end class __ASSET__assets_images_keys1_png extends lime.graphics.Image {}
@:image("assets/images/keys2.png") #if display private #end class __ASSET__assets_images_keys2_png extends lime.graphics.Image {}
@:image("assets/images/merchant_back.png") #if display private #end class __ASSET__assets_images_merchant_back_png extends lime.graphics.Image {}
@:image("assets/images/painkillers.png") #if display private #end class __ASSET__assets_images_painkillers_png extends lime.graphics.Image {}
@:image("assets/images/painkillers_otc.png") #if display private #end class __ASSET__assets_images_painkillers_otc_png extends lime.graphics.Image {}
@:image("assets/images/popup.png") #if display private #end class __ASSET__assets_images_popup_png extends lime.graphics.Image {}
@:image("assets/images/stats.png") #if display private #end class __ASSET__assets_images_stats_png extends lime.graphics.Image {}
@:image("assets/images/thumbs_14x14.png") #if display private #end class __ASSET__assets_images_thumbs_14x14_png extends lime.graphics.Image {}
@:image("assets/images/transition.png") #if display private #end class __ASSET__assets_images_transition_png extends lime.graphics.Image {}
@:file("assets/music/go_back.wav") #if display private #end class __ASSET__assets_music_go_back_wav extends lime.utils.Bytes {}
@:file("assets/music/go_home.wav") #if display private #end class __ASSET__assets_music_go_home_wav extends lime.utils.Bytes {}
@:file("assets/music/injured.wav") #if display private #end class __ASSET__assets_music_injured_wav extends lime.utils.Bytes {}
@:file("assets/music/open_page.wav") #if display private #end class __ASSET__assets_music_open_page_wav extends lime.utils.Bytes {}
@:file("assets/music/sold_data.wav") #if display private #end class __ASSET__assets_music_sold_data_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end