
#import <Foundation/Foundation.h>

@interface NSString (Tools)
/**
 *  判断字符串为空
 *
 *  @param checkString 需要判断的字符串
 *
 *  @return 为真则为空，否则不为空
 */
+(BOOL) checkIsNullString:(NSString *)checkString;
/**
 *  判断是否为中文字符
 *
 *  @param checkString 需要判断的字符串
 *
 *  @return 为真则为中文字符，否则不全为中文字符
 */
+(BOOL) checkIsChineseString:(NSString *)checkString;
/**
 *  判断是否为电话号码
 *
 *  @param phone 需要判断的电话号码
 *
 *  @return 为真则为电话号码，否则不是
 */
+(BOOL) checkIsPhoneString:(NSString *) phone;
/**
 *  判断两个字符串是否相等
 *
 *  @param _strString1 第一个需要判断的字符串
 *  @param _strString2 与第一个比较的字符串
 *
 *  @return 为真则相等，否则不相等
 */
+(BOOL) checkIsEqualString:(NSString *)_strString1 withCompareString:(NSString *)_strString2;
/**
 *  MD5加密
 *
 *  @param inputString 需要加密的字符串
 *
 *  @return 加密后的字符串
 */
+(NSString *) md5:(NSString *) inputString;
/**
 *  字典转Data
 *
 *  @param dict 需要转的字典
 *
 *  @return 转成的data
 */
+(NSData *) jsonDataWithNSDictionary:(NSDictionary *)dict;
/**
 *  data转json对象
 *
 *  @param data 需要转的data
 *
 *  @return 转的json对象
 */
+(id) jsonObjectWithData:(NSData *) data;
/**
 *  字典转String
 *
 *  @param dict 需要转的字典
 *
 *  @return 字典转成的字符串
 */
+(NSString *) jsonStringWithNSDictionary:(NSDictionary *) dict;
/**
 *  字符串转json对象
 *
 *  @param jsonString 需要转的字符串
 *
 *  @return json对象
 */
+(id) jsonObjectWithNSString:(NSString *) jsonString;
@end
