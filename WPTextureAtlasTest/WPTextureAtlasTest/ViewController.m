//
//  ViewController.m
//  WPTextureAtlasTest
//
//  Created by tu jinqiu on 2018/5/29.
//  Copyright © 2018年 tu jinqiu. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>

@interface ViewController ()

@property(nonatomic, strong) SKView *skView;
@property(nonatomic, strong) SKScene *skScene;

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

@end
