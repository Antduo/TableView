//
//  XJUtilsMacro.h
//  XiangJianApp
//
//  Created by qiuxiaofeng on 16/1/14.
//  Copyright © 2016年 qiuxiaofeng. All rights reserved.
//
#import <objc/runtime.h>
#import <EXTScope.h>

#ifndef XJUtilsMacro_h
#define XJUtilsMacro_h

#pragma mark - log

#ifdef DEBUG
#define DString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define DLog(...) printf("\n************\n%s 第%d行: %s\n************\n", [DString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
#define DLog(...)
#endif

#pragma mark - normal

#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kKeyWindow ((UIWindow *)[UIApplication sharedApplication].keyWindow)
#define UIFontSize(fontSize) [UIFont systemFontOfSize:FitFontSize(fontSize)]
#define UIBoldFontSize(fontSize) [UIFont boldSystemFontOfSize:FitFontSize(fontSize)]
#define UIImageWithName(imageName) [UIImage imageNamed:imageName]
#define kCurrentBundleVersion ((NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define kBundleId [[NSBundle mainBundle] bundleIdentifier]

#pragma mark - device

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

#pragma mark - screen

#define iPhone4Or4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5Or5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_Ratio_W ([UIScreen mainScreen].bounds.size.width/414)
#define SCREEN_Ratio_H ([UIScreen mainScreen].bounds.size.height/736)

#pragma mark - system

#define iOS9OrLater ([[[UIDevice currentDevice] systemVersion]doubleValue]>=9.0f)
#define iOS8OrLater ([[[UIDevice currentDevice] systemVersion]doubleValue]>=8.0f)
#define iOS7OrLater ([[[UIDevice currentDevice] systemVersion]doubleValue]>=7.0f)

#pragma mark - color

#define UIColorFromHexWithAlpha(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]
#define UIColorFromHex(hexValue)            UIColorFromHexWithAlpha(hexValue,1.0)
#define UIColorFromRGBA(r,g,b,a)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(r,g,b)               UIColorFromRGBA(r,g,b,1.0)

#pragma mark - indexPath

#define INDEX_PATH(a,b) [NSIndexPath indexPathWithIndexes:(NSUInteger[]){a,b} length:2]

#pragma mark - transforms

#define DEGREES_TO_RADIANS(degrees) degrees * M_PI / 180

#pragma mark - other

#define kOnePixel (1.0f / [UIScreen mainScreen].scale)
#define WeakSelf @weakify(self);
#define StrongSelf @strongify(self);

/*
弱引用/强引用  可配对引用在外面用ICWeakSelf(self)，block用ICStrongSelf(self)
也可以单独引用在外面用ICWeakSelf(self) block里面用weakself
 */
#define ICWeakSelf(type)  __weak typeof(type) weak##type = type;
#define ICStrongSelf(type)  __strong typeof(type) type = weak##type;

#define kScreenScale ([UIScreen mainScreen].scale)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

#pragma mark - static method

static inline BOOL IsEmpty(id thing) {
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

static inline id objectForKey(NSDictionary *dict, NSString *key)
{
    if (!([dict isKindOfClass:[NSDictionary class]] || [dict isKindOfClass:[NSMutableDictionary class]])) {
        return nil;
    }
    if (dict.count == 0 || !dict)
    {
        return nil;
    }
    if (!key) {
        return nil;
    }
    id object = [dict objectForKey:key];
    return [object isEqual:[NSNull null]] ? nil : object;
}

static inline id objectAtArrayIndex(NSArray *array, NSUInteger index)
{
    if (!([array isKindOfClass:[NSArray class]] || [array isKindOfClass:[NSMutableArray class]])) {
        return nil;
    }
    if (array && array.count > index) {
        return array[index];
    } else {
        return nil;
    }
}

/**
 *  把一个数据模型里的属性根据属性名保存到字典里，空值将会忽略掉
 *
 *  @param model 模型类
 *
 *  @return 不包含空值的（一维）可变字典
 */
static inline NSMutableDictionary* GetDictFromModel(id model)
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList([model class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if (!IsEmpty([model valueForKey:key]) && !IsEmpty(key)) {
            [dict setObject:[model valueForKey:key] forKey:key];
        }
    }
    return dict;
}

//static inline void onMainThreadAsync(void (^block)())
//{
//    if ([NSThread isMainThread]) block();
//    else dispatch_async(dispatch_get_main_queue(), block);
//}

//字体适配方法，iphone6plus为基准
static inline CGFloat FitFontSize(CGFloat fontSize)
{
    if (iPhone6Plus) {
        return fontSize;
    }else if(iPhone6){
        return fontSize * (kScreenWidth/(414 - 20)); //-20修正系数
    } else {
        return fontSize * (kScreenWidth/(375 - 30));//-30 修正系数
    }
}

#endif /* XJUtilsMacro_h */
