//
//  WPSpriteNode.h
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/6/2.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "WPTexture.h"

@interface WPSpriteNode : SKSpriteNode

+ (instancetype)spriteNodeWithWPTexture:(WPTexture *)texture;
- (instancetype)initWithWPTexture:(WPTexture *)texture;

@end
