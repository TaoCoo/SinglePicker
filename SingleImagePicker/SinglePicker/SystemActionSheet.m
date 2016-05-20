//
//  SystemActionSheet.m
//  Alert
//
//  Created by GTF on 16/1/25.
//  Copyright © 2016年 GUY. All rights reserved.
//

#import "SystemActionSheet.h"

@implementation SystemActionSheet

+ (void)loadActionSheetInVC:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message handelTitle:(NSArray *)handelTitle handler:(void(^)(NSInteger actionTag))actionBlock{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:cancelAction];
    
    
    // 遍历处理事件
    [handelTitle enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *handelerAction = [UIAlertAction actionWithTitle:(NSString *)obj style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            actionBlock(idx);
        }];
        
        [alertController addAction:handelerAction];
    }];
    
    // 添加至父视图
    [viewController presentViewController:alertController animated:YES completion:nil];
    
}
@end
