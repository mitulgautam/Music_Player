//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <flute_music_player/MusicFinderPlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [MusicFinderPlugin registerWithRegistrar:[registry registrarForPlugin:@"MusicFinderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
