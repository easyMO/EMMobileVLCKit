//
//  EMVLCMedia.h
//  EMMobileVLCKit
//
//  Created by Philipp Wallisch on 25.06.19.
//  Copyright © 2019 easyMOBIZ mobile IT solutions GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EMVLCMedia : NSObject

+ (instancetype)mediaWithURL:(NSURL *)anURL;

- (void)addOptions:(NSDictionary*)options;

@end
