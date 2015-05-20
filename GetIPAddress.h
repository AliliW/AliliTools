//
//  GetIPAddress.h
//  FamilySchoolPro
//
//  Created by 王力 on 15/5/8.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetIPAddress : NSObject
/**
 *  获取IP地址
 *
 *  @return 返回一个长度为2的数组，其中第0个为公网IP
 */
+ (NSArray *)getIPAddress;
@end
