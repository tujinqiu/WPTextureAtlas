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
    CGRect rect = CGRectFromString(dict[@"textureRect"]);
    CGFloat x = rect.origin.x / totalTexture.size.width;
    CGFloat y = rect.origin.x / totalTexture.size.height;
    CGFloat w = rect.size.width / totalTexture.size.width;
    CGFloat h = rect.size.height / totalTexture.size.height;
    
    WPTexture *texture = [WPTexture textureWithRect:CGRectMake(x, y, w, h) inTexture:totalTexture];
    
    texture.spriteOffset = CGPointFromString(dict[@"spriteOffset"]);
    texture.spriteSize = CGSizeFromString(dict[@"spriteSize"]);
    texture.spriteSourceSize = CGSizeFromString(dict[@"spriteSourceSize"]);
    texture.textureRotated = [dict[@"textureRotated"] boolValue];
    
    return texture;
}

@end
