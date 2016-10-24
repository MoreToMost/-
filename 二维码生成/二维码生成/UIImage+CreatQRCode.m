//
//  UIImage+CreatQRCode.m
//  二维码生成
//
//  Created by 徐靖凯 on 2016/10/22.
//  Copyright © 2016年 xujingkai. All rights reserved.
//

#import "UIImage+CreatQRCode.h"
#import <CoreImage/CoreImage.h>

@implementation UIImage (CreatQRCode)

/**
 *  根据info和size生成对应的二维码
 *
 *  @param info CIImage
 *  @param size  图片宽度(高度)
 */
+ (UIImage *)creatQRcodeWithInformation:(NSString *)info AndSize:(CGFloat)size
{
    //1,创建滤镜对象
    CIFilter * filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //2，恢复默认设置
    [filter setDefaults];
    
    //3，设置数据
    NSData * infoData = [info dataUsingEncoding:NSUTF8StringEncoding];
    
    //KVC
    [filter setValue:infoData forKey:@"inputMessage"];
    
    //4，生成二维码
    CIImage * outputImage = [filter outputImage];
    
    return [self createNonInterpolatedUIImageFormCIImage:outputImage withSize:size];
}

/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    //1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    //2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}

@end
