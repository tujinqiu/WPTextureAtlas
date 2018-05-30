//
//  WPTexture.m
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import "WPTexture.h"

@implementation WPTexture

- (instancetype)initWithDict:(NSDictionary *)dict
                totalTexture:(SKTexture *)totalTexture
{
    if (self = [super init]) {
        _spriteOffset = CGPointFromString(dict[@"spriteOffset"]);
        _spriteSize = CGSizeFromString(dict[@"spriteSize"]);
        _spriteSourceSize = CGSizeFromString(dict[@"spriteSourceSize"]);
        CGRect rect = CGRectFromString(dict[@"textureRect"]);
        CGFloat x = rect.origin.x / totalTexture.size.width;
        CGFloat y = rect.origin.x / totalTexture.size.height;
        CGFloat w = rect.size.width / totalTexture.size.width;
        CGFloat h = rect.size.height / totalTexture.size.height;
        _textureRect = CGRectMake(x, y, w, h);
        _textureRotated = [dict[@"textureRotated"] boolValue];
        
        _texture = [SKTexture textureWithRect:_textureRect inTexture:totalTexture];
    }
    
    return self;
}

@end
