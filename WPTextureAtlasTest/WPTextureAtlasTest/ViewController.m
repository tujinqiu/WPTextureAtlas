//
//  ViewController.m
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/29.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "WPTextureAtlas.h"

@interface ViewController ()

@property(nonatomic, strong) SKView *skView;
@property(nonatomic, strong) SKScene *skScene;
@property(nonatomic, strong) SKSpriteNode *testNode;
@property(nonatomic, strong) WPTextureAtlas *textureAtlas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.skView];
    
    [self.skView presentScene:self.skScene];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showAnimation];
    });
}

- (void)viewDidLayoutSubviews
{
    self.skView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)showAnimation
{
    [self.skScene addChild:self.testNode];
    self.testNode.zPosition = 1;
    self.testNode.position = CGPointMake(self.skScene.size.width / 2, self.skScene.size.height / 2);
    SKAction *action = [SKAction animateWithTextures:self.textureAtlas.sortTexturesArr timePerFrame:1.0 / 30];
    action = [SKAction repeatActionForever:action];
    [self.testNode runAction:action];
}

- (SKView *)skView
{
    if (!_skView) {
        _skView = [[SKView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _skView.contentMode = UIViewContentModeScaleToFill;
        _skView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _skView.backgroundColor = [UIColor blackColor];
        _skView.ignoresSiblingOrder = YES;
#ifdef DEBUG
        _skView.showsFPS = YES;
        _skView.showsNodeCount = YES;
#endif
    }
    
    return _skView;
}

- (SKScene *)skScene
{
    if (!_skScene) {
        _skScene = [[SKScene alloc] initWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _skScene.scaleMode = SKSceneScaleModeAspectFill;
    }
    
    return _skScene;
}

- (SKSpriteNode *)testNode
{
    if (!_testNode) {
        _testNode = [[SKSpriteNode alloc] initWithTexture:self.textureAtlas.sortTexturesArr.firstObject];
    }
    
    return _testNode;
}

- (WPTextureAtlas *)textureAtlas
{
    if (!_textureAtlas) {
        NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
        _textureAtlas = [[WPTextureAtlas alloc] initWithPlistFile:plistFile imageFile:@"test"];
    }
    
    return _textureAtlas;
}

@end
