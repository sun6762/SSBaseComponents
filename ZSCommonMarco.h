//
//  ZSCommonMarco.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#ifndef ZSCommonMarco_h
#define ZSCommonMarco_h

//MARK:model
#ifdef DEBUG
#define debugModel 1
#else
#define debugModel 0
#endif

//MARK:Log
#ifdef DEBUG
#define NSLog(format, ...) NSLog((@"%s : %d " format), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(format, ...)
#endif


#define ZS_LAZYLOADING(variable,block)     if(!variable) {block} return variable


//MARK:硬件信息
#define kSCREEN_BOUNDS          [UIScreen mainScreen].bounds
#define kSCREEN_WIDTH           [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT          [UIScreen mainScreen].bounds.size.height
#define kCurrentLanguage        [[NSLocale preferredLanguages] objectAtIndex:0]
#define kOSVersion              [[[UIDevice currentDevice] systemVersion] floatValue]

//MARK:软件信息
#define kAppName                @""
#define kProductName            @""
#define kVersionString          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define kBundleVersion          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define kBundleName             [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
#define kBundleDisplayName      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define kBundleIdentifier       [[NSBundle mainBundle] bundleIdentifier]

//MARK:适配
#define kLaterVersion(version)  ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)

#define k480                    (kSCREEN_HEIGHT == 480)
#define k568                    (kSCREEN_HEIGHT == 568)
#define k667                    (kSCREEN_HEIGHT == 667)
#define k736                    (kSCREEN_HEIGHT == 736)
#define kIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPHoneXr
#define kIsiPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs
#define kIsiPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs Max
#define kIsiPhoneXSMAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define kHeight_StatusBar       (kIsiPhoneX || kIsiPhoneXR || kIsiPhoneXS || kIsiPhoneXSMAX)?44.0f:20.0f
#define kHeight_NavBar          (kIsiPhoneX || kIsiPhoneXR || kIsiPhoneXS || kIsiPhoneXSMAX)?88.0f:64.0f
#define kHeight_TabBar          (kIsiPhoneX || kIsiPhoneXR || kIsiPhoneXS || kIsiPhoneXSMAX)?83.0f:49.0f

#define kIPhoneXBottomSpace     34.0f

//MARK:字体
#define kFont(fontName, x)      [UIFont fontWithName:fontName size:x]
#define kRegularFont(x)         [UIFont fontWithName:@"PingFangSC-Regular" size:x] ?: [UIFont systemFontOfSize:x]
#define kLightFont(x)           [UIFont fontWithName:@"PingFangSC-Light" size:x] ?: [UIFont systemFontOfSize:x]
#define kMediumFont(x)          [UIFont fontWithName:@"PingFangSC-Medium" size:x] ?: [UIFont systemFontOfSize:x]
#define kSemiboldFont(x)        [UIFont fontWithName:@"PingFangSC-Semibold" size:x] ?: [UIFont systemFontOfSize:x]

#define kItalicFont(x)          [UIFont italicSystemFontOfSize:x]
#define kBoldFont(x)            [UIFont boldSystemFontOfSize:x]

//MARK:颜色
#define kRGBAColor(r,g,b,a)     [UIColor colorWithRed:((float)(r))/255.0f green:((float)(g))/255.0f blue:((float)(b))/255.0f alpha:((float)(a))]
#define kRGBColor(r,g,b)        kRGBAColor(r,g,b,1)
#define kHEXColor(hex)          kRGBColor(((hex & 0xFF0000) >> 16), ((hex & 0xFF00) >> 8), (hex & 0xFF))

// 十六进制以alpha开头
#define kHEXColorFrontAlpha(hex)   kRGBAColor(((hex & 0xFF0000) >> 16), ((hex & 0xFF00) >> 8), (hex & 0xFF), (hex & 0xFF000000)/255.f)

// 十六进制以alpha结尾
#define kHEXColorBackAlpha(hex)          kRGBAColor(((hex & 0xFF000000) >> 16), ((hex & 0xFF0000) >> 8), (hex & 0xFF00), (hex & 0xFF)/255.f)

#define kRandomColor            kRGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//MARK:强弱指针
#if DEBUG
#define weakify(object) autoreleasepool{} __weak typeof(object) object##Weak = object;
#define strongify(object) autoreleasepool{} __strong typeof(object) object = object##Weak;
#else
#define weakify(object) try{} @finally{} {} __weak typeof(object) object##Weak = object;
#define strongify(object) try{} @finally{} __strong typeof(object) object = object##Weak;
#endif

//MARK:加载本地文件
#define kLoadImage(file,type)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define kLoadArray(file,type)   [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define kLoadDict(file,type)    [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define kLoadData(file,type)    [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define kLocalizedString(strig) NSLocalizedString(strig, nil)

//MARK:Budle
#define kBundle(bundleName)     [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:(bundleName) withExtension:@"bundle"]]
#define kLoadBundleNib(bundleName,nibName,index) [kBundle(bundleName) loadNibNamed:(nibName) owner:nil options:nil][(index)];
#define kGetViewController(storyboard, identifier) [[UIStoryboard storyboardWithName:storyboard bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:identifier]

//MARK:判空
#define kIsNull(string)         (([string length] == 0) ? YES : NO)
#define kStringOrNil(string)    ((string && [string length] > 0)? string: @"")
#define kStringOrOther(string,string1) (string && [string length] > 0)?string:string1

//MARK:存储路径
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kLibraryeDir            NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]
#define kDocumentDir            NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define kTempDir                NSTemporaryDirectory()

//MARK:delegate
#define kAppDelegate            ((SXAppDelegate *)[UIApplication sharedApplication]).delegate
//MARK:keyWindow
#define kKeyWindow              [UIApplication sharedApplication].keyWindow
//MARK:rootViewController
#define kRootViewController     [UIApplication sharedApplication].keyWindow.rootViewController

//MARK:@interface
#define singleton_interface(className) \
+ (instancetype)shared##className; \
- (instancetype)init NS_UNAVAILABLE; \
+ (instancetype)new NS_UNAVAILABLE;



//MARK:@implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (instancetype)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
+ (instancetype)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
- (instancetype)copyWithZone:(NSZone *)zone{ \
return _instance; \
} \
- (instancetype)mutableCopyWithZone:(NSZone *)zone{ \
return _instance; \
}

#endif /* SXCommonMarco_h */
