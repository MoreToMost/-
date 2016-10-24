//
//  ViewController.m
//  二维码生成
//
//  Created by 徐靖凯 on 2016/10/21.
//  Copyright © 2016年 xujingkai. All rights reserved.
//

#import "ViewController.h"

#import "CIImage+CreatQRCode.h"

#import "UIImage+CreatQRCode.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     1，介绍
       二维码是用特定的几何图形来记录信息
       在之前，常用的二维码开发框架有Z*和ZBarSDK
       苹果从ios7开始集成了二维码的生成和读取功能，并且之前的框架不支持64位，因此目前只使用苹果的框架即可
       注意：此处仅学习简单使用
       二维码的开发
         生成二维码
         扫描二维码
     
     2，二维码的生成
       二维码的生成就是将固定的信息生成对应的二维码图形
       生成二维码的步骤：   
         导入CoreImage框架
         通过滤镜CIFilter生成二维码
           创建滤镜对象
           设置滤镜的默认设置
           给滤镜设置数据（KVC）
           获取生成的二维码图形
     */
    void(^block)(NSString *, CGFloat) = ^(NSString * info, CGFloat size) {
        
        NSLog(@"++++++");
        
    };
    
    block(@"123132", 200);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString * info = @"100av.com";
    
    //UIImage
    self.imageView.image = [UIImage creatQRcodeWithInformation:info AndSize:200];
    
    //CIImage
    self.imageView.image = [CIImage creatQRcodeWithInformation:info AndSize:200];
    
}

@end
