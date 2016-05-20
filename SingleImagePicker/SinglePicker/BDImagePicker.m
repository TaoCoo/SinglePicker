//
//  ImagePicker.m
//  BDKit
//
//  Created by Liu Jinyong on 16/1/20.
//  Copyright © 2016年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDImagePicker.h"
#import "SystemActionSheet.h"

@interface BDImagePicker()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, copy) BDImagePickerFinishAction finishAction;
@property (nonatomic, assign) BOOL allowsEditing;

@end


static BDImagePicker *bdImagePickerInstance = nil;

@implementation BDImagePicker

+ (void)showImagePickerFromViewController:(UIViewController *)viewController allowsEditing:(BOOL)allowsEditing finishAction:(BDImagePickerFinishAction)finishAction {
    if (bdImagePickerInstance == nil) {
        bdImagePickerInstance = [[BDImagePicker alloc] init];
    }
    
    [bdImagePickerInstance showImagePickerFromViewController:viewController
                                               allowsEditing:allowsEditing
                                                finishAction:finishAction];
}

- (void)showImagePickerFromViewController:(UIViewController *)viewController
                            allowsEditing:(BOOL)allowsEditing
                             finishAction:(BDImagePickerFinishAction)finishAction {
    _finishAction = finishAction;
    _allowsEditing = allowsEditing;
    
    [SystemActionSheet loadActionSheetInVC:viewController withTitle:nil message:@"请选择图片" handelTitle:@[@"拍照",@"从相册选择"] handler:^(NSInteger actionTag) {
        
        if (actionTag == 0) {
           
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.allowsEditing = _allowsEditing;
            [viewController presentViewController:picker animated:YES completion:nil];

            
        }else if(actionTag == 1){
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            [viewController presentViewController:picker animated:YES completion:nil];
        }else {
            bdImagePickerInstance = nil;
        }
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (image == nil) {
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    if (_finishAction) {
        _finishAction(image);
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    bdImagePickerInstance = nil;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if (_finishAction) {
        _finishAction(nil);
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    bdImagePickerInstance = nil;
}

@end
