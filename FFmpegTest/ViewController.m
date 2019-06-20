//
//  ViewController.m
//  FFmpegTest
//
//  Created by iOS_Onion on 2019/6/17.
//  Copyright © 2019 iOS_Onion. All rights reserved.
//

#import "ViewController.h"
#import "avformat.h"
#import <stdio.h>
#import "FFmpeg-iOS/FFmpegManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.0f, 30.0f, CGRectGetWidth(self.view.frame), 40);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn setTitle:@"转换格式" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)handleClickEvent:(UIButton *)sender
{
    NSString *pathStr = [[NSBundle mainBundle]pathForResource:@"dynamic" ofType:@"mp4"];
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *outPath = [NSString stringWithFormat:@"%@/output.flv",array[0]];
    NSLog(@"outPath:%@",outPath);
    
    NSArray *cmdArray = @[@"ffmpeg",@"-i",pathStr,@"-f",@"flv",@"-ar",@"44100",@"-y",outPath];
    
    [[FFmpegManager sharedManager] runCmdWithArray:cmdArray];
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}




@end
