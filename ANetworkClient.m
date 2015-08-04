//
//  ALNetworkClient.m
//  AFNetWorking
//
//  Created by 王力 on 15/7/24.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "ANetworkClient.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
@implementation ANetworkClient
/**
 *  判读是否网络可达
 *
 *  @return YES可达，NO不可达
 */
+(void) isReaReachabilityCompletely:(void (^)(BOOL))completely{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    __block BOOL flag = YES;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                flag = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                flag = YES;
                break;
            default:
                break;
        }
        completely(flag);
    }];
}
/**
 *  get请求
 *
 *  @param baseUrl   请求地址
 *  @param parameter 请求参数
 *  @param success   成功返回参数
 *  @param failure   失败返回参数
 */
+(void) getRequestWithBaseUrl:(NSString *) baseUrl parameterDict:(NSDictionary *) parameter needPrompt:(BOOL) flag success:(void(^)(id object)) success failure:(void(^)(id object)) failure{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (flag == YES) {
            [SVProgressHUD show];
        }
        [ANetworkClient isReaReachabilityCompletely:^(BOOL networkFlag) {
            if (networkFlag == YES) {
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
                [manager GET:baseUrl parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    success(responseObject);
                    [SVProgressHUD dismiss];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    failure(error);
                    [SVProgressHUD dismiss];
                }];
                
            }else{
                [SVProgressHUD dismiss];
                return ;
            }
        }];
    });
}
/**
 *  post Request
 *
 *  @param baseUrl   请求地址
 *  @param parameter 请求参数
 *  @param success   成功返回参数
 *  @param failure   失败返回参数
 */
+(void) postRequestWithBaseUrl:(NSString *) baseUrl parameterDict:(NSDictionary *) parameter needPrompt:(BOOL) flag success:(void(^)(id object)) success failure:(void(^)(id object)) failure{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (flag == YES) {
            [SVProgressHUD show];
        }
        [ANetworkClient isReaReachabilityCompletely:^(BOOL networkFlag) {
            if (networkFlag == YES) {
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
                [manager POST:baseUrl parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    success(responseObject);
                    [SVProgressHUD dismiss];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    failure(error);
                    [SVProgressHUD dismiss];
                }];
            }else{
                [SVProgressHUD dismiss];
                return ;
            }
        }];
    });
}
/**
 *  download file
 *
 *  @param fileUrl 下载文件的地址
 *  @param success 下载成功文件存储路径
 *  @param failure 下载失败文件存储路径
 */
+(void) downloadFileWithUrl:(NSString *) fileUrl needPrompt:(BOOL) flag  success:(void(^)(NSURL *fileUrl)) success failure:(void(^)()) failure{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (flag == YES) {
            [SVProgressHUD show];
        }
        [ANetworkClient isReaReachabilityCompletely:^(BOOL networkFlag) {
            if (networkFlag == YES) {
                NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
                AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
                NSString *urlString = [fileUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                NSURL *url = [NSURL URLWithString:urlString];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                    // 指定下载文件保存的路径
                    // 将下载文件保存在缓存路径中
                    NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
                    NSString *path = [cacheDir stringByAppendingPathComponent:response.suggestedFilename];
                    // URLWithString返回的是网络的URL,如果使用本地URL,需要注意
                    NSURL *fileURL = [NSURL fileURLWithPath:path];
                    if (success) {
                        success(fileURL);
                    }
                    [SVProgressHUD dismiss];
                    return fileURL;
                } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                    if (failure) {
                        failure();
                        [SVProgressHUD dismiss];
                    }
                }];
                [task resume];
            }else{
                return ;
            }
        }];
    });
}
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
+(void) uploadFileWithUrl:(NSString *) addressUrl fileUrl:(NSURL *) fileUrl fileName:(NSString *) fileName fileType:(NSString *) fileType needPrompt:(BOOL) flag success:(void(^)(id object)) success failure:(void(^)()) failure{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (flag == YES) {
            [SVProgressHUD show];
        }
        [ANetworkClient isReaReachabilityCompletely:^(BOOL networkFlag) {
            if (networkFlag == YES) {
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
                manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                [manager POST:addressUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                    [formData appendPartWithFileURL:fileUrl name:@"uploadFile" fileName:fileName mimeType:fileType error:NULL];
                } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    if (success) {
                        success(responseObject);
                    }
                    [SVProgressHUD dismiss];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    if (failure) {
                        failure();
                    }
                    [SVProgressHUD dismiss];
                }];
            }else{
                [SVProgressHUD dismiss];
                return ;
            }
        }];
    });
}
/**
 *  upload file named by server
 *
 *  @param addressUrl 上传服务器地址
 *  @param fileUrl    文件url
 *  @param success    成功返回值
 *  @param failure    失败返回值
 */
+(void) uploadFileWithUrl:(NSString *) addressUrl fileUrl:(NSURL *) fileUrl needPrompt:(BOOL) flag success:(void(^)(id object)) success failure:(void(^)()) failure{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (flag == YES) {
            [SVProgressHUD show];
        }
        [ANetworkClient isReaReachabilityCompletely:^(BOOL networkFlag) {
            if (networkFlag == YES) {
                AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
                // AFHTTPResponseSerializer就是正常的HTTP请求响应结果:NSData
                // 当请求的返回数据不是JSON,XML,PList,UIImage之外,使用AFHTTPResponseSerializer
                // 实际上就是AFN没有对响应数据做任何处理的情况
                manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                // formData是遵守了AFMultipartFormData的对象
                [manager POST:addressUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                    // 将本地的文件上传至服务器
                    [formData appendPartWithFileURL:fileUrl name:@"uploadFile" error:NULL];
                } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    if (success) {
                        success(responseObject);
                    }
                    [SVProgressHUD dismiss];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"错误 %@", error.localizedDescription);
                    if (failure) {
                        failure();
                    }
                    [SVProgressHUD dismiss];
                }];
            }else{
                [SVProgressHUD dismiss];
                return ;
            }
        }];
    });
}
@end
