//
//  WPTexture.h
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface WPTexture : SKTexture

// 裁剪后图片的中心相对于裁剪前图片的中心偏移量
@property(nonatomic, assign, readonly) CGPoint spriteOffset;
// 裁剪之后的大小
@property(nonatomic, assign, readonly) CGSize spriteSize;
// 裁剪之前的大小
@property(nonatomic, assign, readonly) CGSize spriteSourceSize;
// 是否顺时针旋转90度
@property(nonatomic, assign, readonly) BOOL textureRotated;

+ (instancetype)textureWithDict:(NSDictionary *)dict
                   totalTexture:(SKTexture *)totalTexture;

@end
