//
//  XJHAVManager.h
//  XJHAVManager
//
//  Created by xujunhao on 2018/9/3.
//  相机相册权限配置检测

#import <Foundation/Foundation.h>
#import "XJHAVManagerParamBuilder.h"

/**
 权限授权成功回调
 */
typedef void(^XJHAVManagerAuthorizedCompletion)(void);

/**
 权限配置受限回调

 @param builder 参数配置builder
 */
typedef void(^XJHAVManagerAuthorizedRestriction)(XJHAVManagerParamBuilder *builder);


/**
 权限配置否决回调

 @param builder 参数配置builder
 */
typedef void(^XJHAVManagerAuthorizedRejection)(XJHAVManagerParamBuilder *builder);



@interface XJHAVManager : NSObject

/**
 检测相机权限配置

 @param completion 相机已授权回调
 @param restriction 相机授权受限配置回调
 @param rejection 相机授权被拒配置回调
 */
+ (void)checkCameraAuthorizationWithCompletion:(XJHAVManagerAuthorizedCompletion)completion
								   restriction:(XJHAVManagerAuthorizedRestriction)restriction
									 rejection:(XJHAVManagerAuthorizedRejection)rejection;

/**
 检测相册权限配置

 @param completion 相册已授权回调
 @param restriction 相册授权受限配置回调
 @param rejection 相册授权被拒配置回调
 */
+ (void)checkPhotoAlbumAuthorizationWithCompletion:(XJHAVManagerAuthorizedCompletion)completion
									   restriction:(XJHAVManagerAuthorizedRestriction)restriction
										 rejection:(XJHAVManagerAuthorizedRejection)rejection;

@end
