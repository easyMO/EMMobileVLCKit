//
//  EMVLCMediaPlayer.h
//  EMMobileVLCKit
//
//  Copyright (C) 2019 easyMOBIZ mobile IT solutions GmbH
//
//  This library is free software; you can redistribute it and/or
//  modify it under the terms of the GNU Lesser General Public
//  License as published by the Free Software Foundation; either
//  version 2.1 of the License, or (at your option) any later version.
//
//  This library is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//  Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with this library; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
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
