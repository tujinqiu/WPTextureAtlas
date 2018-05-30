//
//  WPTextureAtlas.m
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/30.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import "WPTextureAtlas.h"

@implementation WPTextureAtlas

- (instancetype)initWithPlistFile:(NSString *)plistFile
                        imageFile:(NSString *)imageFile
{
    if (self = [super init]) {
        _plistFile = plistFile;
        _imageFile = imageFile;
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    _totalTexture = [SKTexture textureWithImage:[UIImage imageNamed:_imageFile]];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:_plistFile];
    [self p_parseWithDict:dict];
}

- (void)p_parseWithDict:(NSDictionary *)dict
{
    NSDictionary *framesDict = dict[@"frames"];
    NSMutableDictionary *texturesDict = [NSMutableDictionary new];
    [framesDict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSDictionary * _Nonnull obj, BOOL * _Nonnull stop) {
        WPTexture *texture = [WPTexture textureWithDict:obj totalTexture:self.totalTexture];
        [texturesDict setObject:texture forKey:key];
    }];
    _texturesDict = texturesDict.copy;
    NSArray *sortKeys = [self.texturesDict.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString * _Nonnull obj1, NSString * _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSMutableArray *tempArr = [NSMutableArray new];
    for (NSString *key in sortKeys) {
        [tempArr addObject:self.texturesDict[key]];
    }
    _sortTexturesArr = tempArr.copy;
}

@end
