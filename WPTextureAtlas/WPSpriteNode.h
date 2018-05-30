//
//  WPSpriteNode.h
//  WPTextureAtlasTest
//
//  Created by tu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "WPTexture.h"

@interface WPSpriteNode : SKSpriteNode

+ (instancetype)spriteNodeWithWPTexture:(WPTexture *)texture;
- (instancetype)initWithWPTexture:(WPTexture *)texture;

@end
