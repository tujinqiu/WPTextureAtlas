# WPTextureAtlas
SpriteKit读取TexturePacker导出的纹理集

**用法**
```
    NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    WPTextureAtlas *textureAtlas = [[WPTextureAtlas alloc] initWithPlistFile:plistFile imageFile:@"test"];
    WPTexture *texture = [textureAtlas textureWithName:@"box_yaobai_00007.png"];
```

**非裁剪纹理集**
```
    SKSpriteNode *spriteNode = [[SKSpriteNode alloc] initWithTexture:texture];
    spriteNode.position = CGPointMake(100, 100);
    [self.skScene addChild:spriteNode];
```


**裁剪纹理集**
```
    WPSpriteNode *spriteNode = [[WPSpriteNode alloc] initWithWPTexture:texture];
    spriteNode.position = CGPointMake(100, 100);
    [self.skScene addChild:spriteNode];
```
