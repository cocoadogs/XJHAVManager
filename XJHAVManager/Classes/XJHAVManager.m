//
//  XJHAVManager.m
//  XJHAVManager
//
//  Created by xujunhao on 2018/9/3.
//

#import "XJHAVManager.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/PHPhotoLibrary.h>

@implementation XJHAVManager

#pragma mark - Public Methods

+ (void)checkCameraAuthorizationWithCompletion:(XJHAVManagerAuthorizedCompletion)completion
								   restriction:(XJHAVManagerAuthorizedRestriction)restriction
									 rejection:(XJHAVManagerAuthorizedRejection)rejection {
	XJHAVManagerParamBuilder *restrictionBuilder = [[XJHAVManagerParamBuilder alloc] init];
	XJHAVManagerParamBuilder *rejectionBuilder = [[XJHAVManagerParamBuilder alloc] init];
	!restriction?:restriction(restrictionBuilder);
	!rejection?:rejection(rejectionBuilder);
	AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
	switch (status) {
		case AVAuthorizationStatusNotDetermined:
		{
			[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo
									 completionHandler:^(BOOL granted) {
										 if (granted) {
											 !completion?:completion();
										 }
									 }];
		}
			break;
		case AVAuthorizationStatusRestricted:
		{
			UIAlertController *alertController = [UIAlertController alertControllerWithTitle:restrictionBuilder.title?:@"使用摄像头受限" message:restrictionBuilder.message?:@"请在iOS\"设置\"-\"隐私\"-\"相机\"中打开" preferredStyle:UIAlertControllerStyleAlert];
			[alertController addAction:[UIAlertAction actionWithTitle:restrictionBuilder.cancel?:@"取消" style:UIAlertActionStyleCancel handler:nil]];
			[alertController addAction:[UIAlertAction actionWithTitle:restrictionBuilder.setting?:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
			}]];
			[[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alertController animated:YES completion:nil];
		}
			break;
		case AVAuthorizationStatusDenied:
		{
			UIAlertController *alertController = [UIAlertController alertControllerWithTitle:rejectionBuilder.title?:@"未获得授权使用摄像头" message:rejectionBuilder.message?:@"请在iOS\"设置\"-\"隐私\"-\"相机\"中打开" preferredStyle:UIAlertControllerStyleAlert];
			[alertController addAction:[UIAlertAction actionWithTitle:rejectionBuilder.cancel?:@"取消" style:UIAlertActionStyleCancel handler:nil]];
			[alertController addAction:[UIAlertAction actionWithTitle:rejectionBuilder.setting?:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
			}]];
			[[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alertController animated:YES completion:nil];
		}
			break;
		case AVAuthorizationStatusAuthorized:
		{
			!completion?:completion();
		}
			break;
		default:
			break;
	}
}

+ (void)checkPhotoAlbumAuthorizationWithCompletion:(XJHAVManagerAuthorizedCompletion)completion
									   restriction:(XJHAVManagerAuthorizedRestriction)restriction
										 rejection:(XJHAVManagerAuthorizedRejection)rejection {
	XJHAVManagerParamBuilder *restrictionBuilder = [[XJHAVManagerParamBuilder alloc] init];
	XJHAVManagerParamBuilder *rejectionBuilder = [[XJHAVManagerParamBuilder alloc] init];
	!restriction?:restriction(restrictionBuilder);
	!rejection?:rejection(rejectionBuilder);
	PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
	switch (status) {
		case PHAuthorizationStatusNotDetermined:
		{
			[PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
				if (status == PHAuthorizationStatusAuthorized) {
					!completion?:completion();
				}
			}];
		}
			break;
		case PHAuthorizationStatusRestricted:
		{
			UIAlertController *alertController = [UIAlertController alertControllerWithTitle:restrictionBuilder.title?:@"使用相册受限" message:restrictionBuilder.message?:@"请在iOS\"设置\"-\"隐私\"-\"照片\"中打开" preferredStyle:UIAlertControllerStyleAlert];
			[alertController addAction:[UIAlertAction actionWithTitle:restrictionBuilder.cancel?:@"取消" style:UIAlertActionStyleCancel handler:nil]];
			[alertController addAction:[UIAlertAction actionWithTitle:restrictionBuilder.setting?:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
			}]];
			[[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alertController animated:YES completion:nil];
		}
			break;
		case PHAuthorizationStatusDenied:
		{
			UIAlertController *alertController = [UIAlertController alertControllerWithTitle:rejectionBuilder.title?:@"未获得授权使用相册" message:rejectionBuilder.message?:@"请在iOS\"设置\"-\"隐私\"-\"照片\"中打开" preferredStyle:UIAlertControllerStyleAlert];
			[alertController addAction:[UIAlertAction actionWithTitle:rejectionBuilder.cancel?:@"取消" style:UIAlertActionStyleCancel handler:nil]];
			[alertController addAction:[UIAlertAction actionWithTitle:rejectionBuilder.setting?:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
			}]];
			[[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alertController animated:YES completion:nil];
		}
			break;
		case PHAuthorizationStatusAuthorized:
		{
			!completion?:completion();
		}
			break;
		default:
			break;
	}
}


@end
