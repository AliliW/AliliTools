
#import <Foundation/Foundation.h>

@interface ATakeInfoPlist : NSObject
/**
 *  开发语言环境
 *
 *  @return 返回开发语言环境
 */
+(NSString *) CFBundle_DevelopmentRegion;
/**
 *  获取应用程序展示的名称
 *
 *  @return 返回应用程序展示的名称
 */
+(NSString *) CFBundle_DisplayName;
/**
 *  可执行文档名称
 *
 *  @return 返回可执行文档名称
 */
+(NSString *) CFBundle_Executable;
/**
 *  BundleId
 *
 *  @return BundleId
 */
+(NSString *) CFBundle_Identifier;
/**
 *  info.plist格式的版本
 *
 *  @return info.plist格式的版本
 */
+(NSString *) CFBundle_InfoDictionaryVersion;
/**
 *  infoPlist路径
 *
 *  @return infoPlist路径
 */
+(NSString *) CFBundle_InfoPlistURL;
/**
 *  产品名称
 *
 *  @return 产品名称
 */
+(NSString *) CFBundle_Name;
/**
 *  CFBundleNumericVersion
 *
 *  @return CFBundleNumericVersion
 */
+(NSString *) CFBundle_NumericVersion;
/**
 *  标识包的类型
 *
 *  @return   标识包的类型
 */
+(NSString *) CFBundle_PackageType;
/**
 *  应用程序的版本
 *
 *  @return 应用程序的版本
 */
+(NSString *) CFBundle_ShortVersionString;
/**
 *  签名
 *
 *  @return 签名
 */
+(NSString *) CFBundle_Signature;
/**
 *  应用版本
 *
 *  @return 应用版本
 */
+(NSString *) CFBundle_Version;
+(NSString *) DTCompiler;
+(NSString *) DTPlatformName;
+(NSString *) machineName;
+(NSString *) carrierName;
@end
