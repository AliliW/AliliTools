//
//  ALNetworkClient.h
//  AFNetWorking
//
//  Created by 王力 on 15/7/24.
//  Copyright © 2015年 王力. All rights reserved.
//
/**
 *  使用该类必须首先集成AFNetworking
 *
 *  @return <#return value description#>
 */
#import <Foundation/Foundation.h>

@interface ANetworkClient : NSObject
/**
 *  判读是否网络可达
 *
 *  @return YES可达，NO不可达
 */
+(void) isReaReachabilityCompletely:(void(^)(BOOL networkFlag)) completely;
/**
 *  get Request
 *
 *  @param baseUrl   请求地址
 *  @param parameter 请求参数
 *  @param success   成功返回参数
 *  @param failure   失败返回参数
 */
+(void) getRequestWithBaseUrl:(NSString *) baseUrl parameterDict:(NSDictionary *) parameter success:(void(^)(id object)) success failure:(void(^)(id object)) failure;
/**
 *  post Request
 *
 *  @param baseUrl   请求地址
 *  @param parameter 请求参数
 *  @param success   成功返回参数
 *  @param failure   失败返回参数
 */
+(void) postRequestWithBaseUrl:(NSString *) baseUrl parameterDict:(NSDictionary *) parameter success:(void(^)(id object)) success failure:(void(^)(id object)) failure;
/**
 *  download file
 *
 *  @param fileUrl 下载文件的地址
 *  @param success 下载成功文件存储路径
 *  @param failure 下载失败文件存储路径
 */
+(void) downloadFileWithUrl:(NSString *) fileUrl success:(void(^)(NSURL *fileUrl)) success failure:(void(^)()) failure;
/**
 *  upload file named by owner
 *
 *  @param addressUrl 上传服务器地址
 *  @param fileUrl    文件url
 *  @param fileName   在服务器上的保存名
 *  @param fileType   文件类型
 *  @param success    成功返回值
 *  @param failure    失败返回值
 */
+(void) uploadFileWithUrl:(NSString *) addressUrl fileUrl:(NSURL *) fileUrl fileName:(NSString *) fileName fileType:(NSString *) fileType success:(void(^)(id object)) success failure:(void(^)()) failure;
/**
 *  upload file named by server
 *
 *  @param addressUrl 上传服务器地址
 *  @param fileUrl    文件url
 *  @param success    成功返回值
 *  @param failure    失败返回值
 */
+(void) uploadFileWithUrl:(NSString *) addressUrl fileUrl:(NSURL *) fileUrl success:(void(^)(id object)) success failure:(void(^)()) failure;
@end
