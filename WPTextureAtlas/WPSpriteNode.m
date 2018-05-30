//
//  WPSpriteNode.m
//  WPTextureAtlasTest
//
//  Created by tu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import "WPSpriteNode.h"

@implementation WPSpriteNode

+ (instancetype)spriteNodeWithWPTexture:(WPTexture *)texture
{
    return [[self alloc] initWithWPTexture:texture];
}

- (instancetype)initWithWPTexture:(WPTexture *)texture
{
    if (self = [super initWithTexture:texture]) {
        if (texture.textureRotated) {
            self.zRotation = -M_PI_2;
        }
        CGFloat xOff = texture.spriteOffset.x / texture.spriteSourceSize.width;
        CGFloat yOff = texture.spriteOffset.y / texture.spriteSourceSize.height;
        self.anchorPoint = CGPointMake(0.5 + xOff, 0.5 + yOff);
    }
    
    return self;
}

@end
