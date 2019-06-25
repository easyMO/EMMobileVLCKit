//
//  EMVLCMedia.m
//  EMMobileVLCKit
//
//  Created by Philipp Wallisch on 25.06.19.
//  Copyright © 2019 easyMOBIZ mobile IT solutions GmbH. All rights reserved.
//

#import "EMVLCMedia+Protected.h"

#import <MobileVLCKit/VLCMedia.h>

@implementation EMVLCMedia
{
  VLCMedia *_media;
}

@synthesize media;

+ (instancetype)mediaWithURL:(NSURL *)anURL
{
  return [[EMVLCMedia alloc] initWithURL:anURL];
}

- (instancetype)initWithURL:(NSURL *)anURL
{
  self = [super init];
  if (self) {
    _media = [VLCMedia mediaWithURL:anURL];
  }
  return self;
}

- (void)dealloc
{
  _media = nil;
}

- (void)addOptions:(NSDictionary*)options
{
  [_media addOptions:options];
}

@end
