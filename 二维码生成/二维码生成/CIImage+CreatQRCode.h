//
//  CIImage+CreatQRCode.h
//  二维码生成
//
//  Created by 徐靖凯 on 2016/10/22.
//  Copyright © 2016年 xujingkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIImage (CreatQRCode)

/**
 *  根据info和size生成对应的二维码
 *
 *  @param info CIImage
 *  @param size  图片宽度(高度)
 */
+ (UIImage *)creatQRcodeWithInformation:(NSString *)info AndSize:(CGFloat)size;

@end
