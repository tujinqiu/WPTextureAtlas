//
//  WPTextureAtlas.h
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "WPTexture.h"

@interface WPTextureAtlas : NSObject

@property(nonatomic, strong, readonly) NSString *plistFile;
@property(nonatomic, strong, readonly) NSString *imageFile;
@property(nonatomic, strong, readonly) SKTexture *totalTexture;
@property(nonatomic, strong, readonly) NSMutableDictionary<NSString *, WPTexture *> *texturesDict;
@property(nonatomic, strong, readonly) NSArray<WPTexture *> *sortTexturesArr;

- (instancetype)initWithPlistFile:(NSString *)plistFile
                        imageFile:(NSString *)imageFile;

@end
