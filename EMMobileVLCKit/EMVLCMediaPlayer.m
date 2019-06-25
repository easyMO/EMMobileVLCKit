//
//  EMVLCMediaPlayer.m
//  EMMobileVLCKit
//
//  Created by Philipp Wallisch on 25.06.19.
//  Copyright © 2019 easyMOBIZ mobile IT solutions GmbH. All rights reserved.
//

#import "EMVLCMediaPlayer.h"
#import "EMVLCMedia+Protected.h"

#import <MobileVLCKit/VLCMediaPlayer.h>

NSString * EMVLCMediaPlayerStateToString(EMVLCMediaPlayerState state)
{
  return VLCMediaPlayerStateToString((VLCMediaPlayerState)state);
}

@interface EMVLCMediaPlayer() <VLCMediaPlayerDelegate>
@end

@implementation EMVLCMediaPlayer
{
  VLCMediaPlayer *_player;
}

@synthesize delegate;

+ (id)new
{
  return [[self alloc] init];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _player = [VLCMediaPlayer new];
    _player.delegate = self;
  }
  return self;
}

- (void)dealloc
{
  _player.delegate = nil;
  _player = nil;
}

#pragma - Delegates

- (void)mediaPlayerStateChanged:(NSNotification *)aNotification
{
  [self.delegate mediaPlayerStateChanged:aNotification];
}

- (void)mediaPlayerTimeChanged:(NSNotification *)aNotification
{
  [self.delegate mediaPlayerStateChanged:aNotification];
}

#pragma mark - Properties

- (void)setDrawable:(id)drawable {
  _player.drawable = drawable;;
}

- (id)drawable {
  return _player.drawable;
}

- (EMVLCMedia *)media {
  return _player.drawable;
}

- (void)setMedia:(EMVLCMedia *)media {
  _player.media = media.media;
}

- (EMVLCMediaPlayerState)state {
  return (EMVLCMediaPlayerState)_player.state;
}

- (CGSize)videoSize {
  return _player.videoSize;
}

- (BOOL)hasVideoOut {
  return _player.hasVideoOut;
}

- (void)setCurrentAudioTrackIndex:(int)index {
  _player.currentAudioTrackIndex = index;
}

- (int)currentAudioTrackIndex {
  return _player.currentAudioTrackIndex;
}

#pragma mark - Methods

- (void)play
{
  [_player play];
}


- (void)stop
{
  [_player stop];
}

@end
