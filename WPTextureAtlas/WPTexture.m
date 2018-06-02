//
//  WPTexture.m
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import "WPTexture.h"

@interface WPTexture ()

@property(nonatomic, assign, readwrite) CGPoint spriteOffset;
@property(nonatomic, assign, readwrite) CGSize spriteSize;
@property(nonatomic, assign, readwrite) CGSize spriteSourceSize;
@property(nonatomic, assign, readwrite) BOOL textureRotated;

@end

@implementation WPTexture

+ (instancetype)textureWithDict:(NSDictionary *)dict
                   totalTexture:(SKTexture *)totalTexture
{
    BOOL textureRotated = [dict[@"textureRotated"] boolValue];
    
    CGRect rect = CGRectFromString(dict[@"textureRect"]);
    // TexturePacker中获取的rect是原点在左上角点，但是SpriteKit、OpenGL默认加载的纹理坐标是原点在左下角点
    CGFloat x, y, w, h;
    if (textureRotated) { // 如果顺时针旋转了90度，width和heigth调换了
        x = rect.origin.x / totalTexture.size.width;
        y = (totalTexture.size.height - rect.origin.y - rect.size.width) / totalTexture.size.height;
        w = rect.size.height / totalTexture.size.width;
        h = rect.size.width / totalTexture.size.height;
    } else {
        x = rect.origin.x / totalTexture.size.width;
        y = (totalTexture.size.height - rect.origin.y - rect.size.height) / totalTexture.size.height;
        w = rect.size.width / totalTexture.size.width;
        h = rect.size.height / totalTexture.size.height;
    }
    
    WPTexture *texture = [WPTexture textureWithRect:CGRectMake(x, y, w, h) inTexture:totalTexture];
    
    texture.spriteOffset = CGPointFromString(dict[@"spriteOffset"]);
    texture.spriteSize = CGSizeFromString(dict[@"spriteSize"]);
    texture.spriteSourceSize = CGSizeFromString(dict[@"spriteSourceSize"]);
    texture.textureRotated = textureRotated;
    
    return texture;
}

@end
