//
//  XJHAVManagerParamBuilder.m
//  XJHAVManager
//
//  Created by xujunhao on 2018/9/3.
//

#import "XJHAVManagerParamBuilder.h"

@implementation XJHAVManagerParamBuilder

- (instancetype)init {
	if (self = [super init]) {
		
	}
	return self;
}

- (NSString *)title {
	return _title;
}

- (NSString *)message {
	return _message;
}

- (NSString *)cancel {
	return _cancel?:@"取消";
}

- (NSString *)setting {
	return _setting?:@"设置";
}

@end
