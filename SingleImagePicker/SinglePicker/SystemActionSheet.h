//
//  SystemActionSheet.h
//  Alert
//
//  Created by GTF on 16/1/25.
//  Copyright © 2016年 GUY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SystemActionSheet : NSObject
/** 系统活动表
 *  @parameter 父视图控制器
 *  @parameter 标题
 *  @parameter 信息
 *  @parameter 处理事件的标题数组
 *  @parameter 返回处理的tag值
 */

+ (void)loadActionSheetInVC:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message handelTitle:(NSArray *)handelTitle handler:(void(^)(NSInteger actionTag))actionBlock;
@end
