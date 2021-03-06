//
//  XJHAVManagerParamBuilder.h
//  XJHAVManager
//
//  Created by xujunhao on 2018/9/3.
//  XJHAVManager参数配置

#import <Foundation/Foundation.h>

@interface XJHAVManagerParamBuilder : NSObject

///弹框标题
@property (nonatomic, copy) NSString *title;
///弹框提示信息
@property (nonatomic, copy) NSString *message;
///取消按键标题，默认为'取消'
@property (nonatomic, copy) NSString *cancel;
///确认按键标题，默认为'设置'
@property (nonatomic, copy) NSString *setting;

@end
