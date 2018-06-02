//
//  WPSpriteNode.m
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/6/2.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import "WPSpriteNode.h"

@implementation WPSpriteNode

+ (instancetype)spriteNodeWithWPTexture:(WPTexture *)texture
{
    return [[WPSpriteNode alloc] initWithWPTexture:texture];
}

- (instancetype)initWithWPTexture:(WPTexture *)texture
{
    if (self = [super initWithTexture:texture]) {
        if (texture.textureRotated) {
            // 顺时针转了90度之后，原来的Y转成与X轴同向，而原来的X变成与-Y同向
            self.anchorPoint = CGPointMake(0.5 - texture.spriteOffset.y / texture.spriteSize.height, 0.5 + texture.spriteOffset.x / texture.spriteSize.width);
            // 逆时针转回90度
            self.zRotation = M_PI_2;
        } else {
            // 根据偏移量将裁剪后的图反向移回原图的中心
            self.anchorPoint = CGPointMake(0.5 - texture.spriteOffset.x / texture.spriteSize.width, 0.5 - texture.spriteOffset.y / texture.spriteSize.height);
        }
    }
    
    return self;
}

@end
