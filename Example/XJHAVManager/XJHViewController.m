//
//  XJHViewController.m
//  XJHAVManager_Example
//
//  Created by xujunhao on 2018/9/3.
//  Copyright © 2018年 xujunhao. All rights reserved.
//

#import "XJHViewController.h"
#import "XJHAVManager.h"
#import "XJHAVManagerParamBuilder.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface XJHViewController ()

@property (nonatomic, strong) UIButton *cameraBtn;
@property (nonatomic, strong) UIButton *photoBtn;

@end

@implementation XJHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self buildUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Build Method

- (void)buildUI {
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:self.cameraBtn];
	[self.view addSubview:self.photoBtn];
	[self.cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.view);
		make.bottom.equalTo(self.view.mas_centerY).offset(-20);
		make.size.mas_equalTo(CGSizeMake(100, 40));
	}];
	[self.photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.view);
		make.top.equalTo(self.view.mas_centerY).offset(20);
		make.size.mas_equalTo(CGSizeMake(100, 40));
	}];
}

#pragma mark - Lazy Load Methods

- (UIButton *)cameraBtn {
	if (!_cameraBtn) {
		_cameraBtn = [[UIButton alloc] init];
		[_cameraBtn setTitle:@"照相机" forState:UIControlStateNormal];
		[_cameraBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
		[_cameraBtn setBackgroundColor:[UIColor whiteColor]];
		_cameraBtn.layer.cornerRadius = 5.0f;
		_cameraBtn.layer.borderWidth = 0.5f;
		_cameraBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
		[[_cameraBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
			[XJHAVManager checkCameraAuthorizationWithCompletion:^{
				NSLog(@"相机已授权");
			} restriction:^(XJHAVManagerParamBuilder *builder) {
				builder.title = @"我靠，相机竟然被限制了";
			} rejection:^(XJHAVManagerParamBuilder *builder) {
				builder.title = @"NNGX，相机你敢拒绝我";
			}];
		}];
	}
	return _cameraBtn;
}

- (UIButton *)photoBtn {
	if (!_photoBtn) {
		_photoBtn = [[UIButton alloc] init];
		[_photoBtn setTitle:@"相册" forState:UIControlStateNormal];
		[_photoBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
		[_photoBtn setBackgroundColor:[UIColor whiteColor]];
		_photoBtn.layer.cornerRadius = 5.0f;
		_photoBtn.layer.borderWidth = 0.5f;
		_photoBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
		[[_photoBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
			[XJHAVManager checkPhotoAlbumAuthorizationWithCompletion:^{
				NSLog(@"相册已授权");
			} restriction:^(XJHAVManagerParamBuilder *builder) {
				builder.title = @"我靠，相册竟然被限制了";
			} rejection:^(XJHAVManagerParamBuilder *builder) {
				builder.title = @"NNGX，相册你敢拒绝我";
			}];
		}];
	}
	return _photoBtn;
}

@end
