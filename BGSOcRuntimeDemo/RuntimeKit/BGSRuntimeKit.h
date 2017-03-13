//
//  BGSRuntimeKit.h
//  BGSOcRuntimeDemo
//
//  Created by bianguangsheng on 2017/3/10.
//  Copyright © 2017年 soufunnet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface BGSRuntimeKit : NSObject

/**
 返回类名

 @param cls 要返回类名的class
 @return 返回类名的字符串
 */
+ (NSString *)fetchClassName:(Class)cls ;

/**
 动态获取类的变量列表

 @param class 要获取列表的类
 @return 所有变量的列表数组
 */
+(NSArray *)fetchIvarList:(Class)class ;

/**
 获取某个类的属性列表

 @param cls 目标类
 @return 此类的属性列表数组
 */
+(NSArray *)fetchPropertyList:(Class)cls;

/**
 获取目标类的属性类型列表

 @param cls 目标类
 @return 属性类型列表的数组
 */
+(NSArray *)fetchPropertyTypeList:(Class)cls;

/**
 获取目标类的方法列表

 @param cls 目标类
 @return 方法列表的数组
 */
+ (NSArray *)fetchMethodList:(Class)cls ;

/**
 获取目标类的协议列表

 @param cls 目标类
 @return 目标类的协议列表数组
 */
+ (NSArray *)fetchProtocolList:(Class)cls;

/**
 为目标类添加动态方法

 @param class 目标类
 @param methodSel 要添加的方法
 @param impMethod 实际实现的方法
 */
+ (void)addMethod: (Class)class  method: (SEL)methodSel ImpMethod:(SEL)impMethod ;

/**
 为目标类动态交换方法

 @param cls 目标类
 @param fM 此类的第一个方法
 @param sM 此类的第二个方法
 */
+ (void) methodSwap:(Class)cls firstMethod:(SEL)fM SecondMethod:(SEL)sM;
@end
