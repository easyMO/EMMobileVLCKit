//
//  EMVLCMediaPlayer.m
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
  EMVLCMedia *_media;
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
  [self.delegate mediaPlayerTimeChanged:aNotification];
}

#pragma mark - Properties

- (void)setDrawable:(id)drawable {
  _player.drawable = drawable;
}

- (id)drawable {
  return _player.drawable;
}

- (void)setMedia:(EMVLCMedia *)media {
  _media = media;
  _player.media = media.media;
}

- (EMVLCMedia *)media {
  return _media;
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
