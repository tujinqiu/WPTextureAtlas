//
//  WPTexture.h
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface WPTexture : NSObject

@property(nonatomic, assign, readonly) CGPoint spriteOffset;
@property(nonatomic, assign, readonly) CGSize spriteSize;
@property(nonatomic, assign, readonly) CGSize spriteSourceSize;
// 是否顺时针旋转90度
@property(nonatomic, assign, readonly) BOOL textureRotated;
// 原点为左上角点
@property(nonatomic, assign, readonly) CGRect textureRect;

@property(nonatomic, strong, readonly) SKTexture *texture;

- (instancetype)initWithDict:(NSDictionary *)dict
                totalTexture:(SKTexture *)totalTexture;

@end
