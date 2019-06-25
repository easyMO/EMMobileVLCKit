//
//  EMVLCMedia.m
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
