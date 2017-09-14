//
//  UIImage+WaterMash.m
//  MP3PlayerShowingLRConLockedScreen
//
//  Created by JianRongCao on 14-3-17.
//  Copyright (c) 2014年 Suning. All rights reserved.
//

#import "UIImage+WaterMash.h"

@implementation UIImage (WaterMash)

- (UIImage *)addWaterMashWithText:(NSString *)text
{
    //获取歌词文字的Rect 便于下面进行文字位置的计算
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:20]};
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.size.width, 30) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    CGFloat newSizeItem = self.size.width > self.size.height ? self.size.height : self.size.width;
    CGSize newSize = CGSizeMake(newSizeItem, newSizeItem);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSizeItem, newSizeItem)];
    CGRect textRect = CGRectMake((newSizeItem - size.width)/2.0, newSizeItem - size.height, size.width, size.height);
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:(id)[UIFont systemFontOfSize:20], NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [text drawInRect:textRect withAttributes:attributes];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
