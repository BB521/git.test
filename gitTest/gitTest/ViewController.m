//
//  ViewController.m
//  gitTest
//
//  Created by Binbin Mu on 2018/5/19.
//  Copyright © 2018年 Binbin Mu. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()

@property(nonatomic ,weak)DrawView *drawView;

@property(nonatomic ,strong)CADisplayLink *display;

@property(nonatomic ,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DrawView *drawView = [[DrawView alloc]initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 300)];
    drawView.backgroundColor = [UIColor grayColor];
    self.drawView = drawView;
    [self.view addSubview:drawView];
    
    CADisplayLink *display = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeCount)];
    self.display = display;
    [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    self.imageView.image = [UIImage imageNamed:@"git常用指令"];
    self.imageView.frame = CGRectMake(20, 400, 200, 200);
    
    [self.view addSubview:self.imageView];
}

-(void)timeCount
{
    [self.drawView setNeedsDisplay];
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
