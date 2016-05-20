//
//  ViewController.m
//  SingleImagePicker
//
//  Created by gut on 16/5/20.
//  Copyright © 2016年 com.DSDAI. All rights reserved.
//

#import "ViewController.h"
#import "BDImagePicker.h"

@interface ViewController ()

@property (nonatomic,strong)UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.backgroundColor = [UIColor redColor];
    _button.frame = CGRectMake(0, 0, 100, 100);
    _button.center = self.view.center;
    [_button setTitle:@"click me" forState:UIControlStateNormal];
    _button.center = self.view.center;
    [_button addTarget:self action:@selector(butonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)butonClick{
    
    __weak typeof(self) weakSelf = self;
    
    [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
        if (image) {
            [weakSelf.button setBackgroundImage:image forState:UIControlStateNormal];
        }
    }];
}

@end
