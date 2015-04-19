//
//  ViewController.m
//  GCDIOSDemo
//
//  Created by Tomson on 15-4-15.
//  Copyright (c) 2015年 Org.CTIL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    button.frame = CGRectMake(0, 200, 200, 100);
    
    button.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:button];
    
    [self.view addSubview:imageView];
    
	// Do any additional setup after loading the view, typically from a nib.
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"下载图片1-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"下载图片2-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"下载图片3-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:@"http://car0.autoimg.cn/upload/spec/9579/u_20120110174805627264.jpg"];
        //UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        NSLog(@"下载图片4-----%@", [NSThread currentThread]);
        //UIImageView *tmpImage = [[UIImageView alloc] initWithImage:image];

        dispatch_async(dispatch_get_main_queue(), ^{
            //[imageView insertSubview:tmpImage atIndex:0];
            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            NSLog(@"图片4 更新主线程-----%@", [NSThread currentThread]);
            
        });
    });
    NSLog(@"主线程-----%@", [NSThread mainThread]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
