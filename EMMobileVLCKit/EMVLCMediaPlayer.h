//
//  EMVLCMediaPlayer.h
//  EMMobileVLCKit
//
//  Created by Philipp Wallisch on 25.06.19.
//  Copyright © 2019 easyMOBIZ mobile IT solutions GmbH. All rights reserved.
//

#import "EMVLCMedia.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EMVLCMediaPlayerState)
{
  EMVLCMediaPlayerStateStopped,        ///< Player has stopped
  EMVLCMediaPlayerStateOpening,        ///< Stream is opening
  EMVLCMediaPlayerStateBuffering,      ///< Stream is buffering
  EMVLCMediaPlayerStateEnded,          ///< Stream has ended
  EMVLCMediaPlayerStateError,          ///< Player has generated an error
  EMVLCMediaPlayerStatePlaying,        ///< Stream is playing
  EMVLCMediaPlayerStatePaused,         ///< Stream is paused
  EMVLCMediaPlayerStateESAdded         ///< Elementary Stream added
};

extern NSString * EMVLCMediaPlayerStateToString(EMVLCMediaPlayerState state);

@class EMVLCMediaPlayer;
@protocol EMVLCMediaPlayerDelegate
- (void)mediaPlayerStateChanged:(NSNotification *)aNotification;
- (void)mediaPlayerTimeChanged:(NSNotification *)aNotification;
@end

@interface EMVLCMediaPlayer : NSObject

@property (weak, nonatomic) id <EMVLCMediaPlayerDelegate> delegate;

@property (strong) id drawable;

@property (NS_NONATOMIC_IOSONLY, strong) EMVLCMedia *media;

@property (NS_NONATOMIC_IOSONLY, readonly) EMVLCMediaPlayerState state;
@property (NS_NONATOMIC_IOSONLY, readonly) CGSize videoSize;
@property (NS_NONATOMIC_IOSONLY, readonly) BOOL hasVideoOut;

@property (readwrite) int currentAudioTrackIndex;

- (void)play;
- (void)stop;

@end
