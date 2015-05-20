//
//  JXTakeInfoPlist.m
//  JiaXiaoJiShiTong
//
//  Created by Jarvis.Tang on 13-12-5.
//  Copyright (c) 2013年 . All rights reserved.
//

#import "ATakeInfoPlist.h"
#import <sys/utsname.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@interface ATakeInfoPlist ()
+(NSDictionary *) infoPlistDic;
@end
@implementation ATakeInfoPlist

+(NSDictionary *) infoPlistDic{
    return [[NSBundle mainBundle] infoDictionary];
}

+(NSString *) CFBundle_DevelopmentRegion{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleDevelopmentRegion"];
}

+(NSString *) CFBundle_DisplayName{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleDisplayName"];
}

+(NSString *) CFBundle_Executable{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleExecutable"];
}

+(NSString *) CFBundle_Identifier{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleIdentifier"];
}

+(NSString *) CFBundle_InfoDictionaryVersion{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleInfoDictionaryVersion"];
}

+(NSString *) CFBundle_InfoPlistURL{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleInfoPlistURL"];
}

+(NSString *) CFBundle_Name{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleName"];
}

+(NSString *) CFBundle_NumericVersion{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleNumericVersion"];
}

+(NSString *) CFBundle_PackageType{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundlePackageType"];
}

+(NSString *) CFBundle_ShortVersionString{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleShortVersionString"];
}

+(NSString *) CFBundle_Signature{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleSignature"];
}

+(NSString *) CFBundle_Version{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"CFBundleVersion"];
}

+(NSString *) DTCompiler{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"DTCompiler"];
}

+(NSString *) DTPlatformName{
    return [[TakeInfoPlist infoPlistDic] objectForKey:@"DTPlatformName"];
}


+(NSString *) machineName{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

+(NSString *) carrierName{
    CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netInfo subscriberCellularProvider];
    NSString *tempCarrierName = [carrier carrierName];
    if (tempCarrierName == nil) {
        tempCarrierName = @"模拟器";
    }
    return tempCarrierName;
}

@end
