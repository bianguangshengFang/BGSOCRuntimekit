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
+ (NSString *)fetchClassName:(Class)cls ;
+(NSArray *)fetchIvarList:(Class)class ;
+(NSArray *)fetchPropertyList:(Class)cls;
+(NSArray *)fetchPropertyTypeList:(Class)cls;
+ (NSArray *)fetchMethodList:(Class)cls ;
+ (NSArray *)fetchProtocolList:(Class)cls;
+ (void)addMethod: (Class)class  method: (SEL)methodSel ImpMethod:(SEL)impMethod ;
+ (void) methodSwap:(Class)cls firstMethod:(SEL)fM SecondMethod:(SEL)sM;
@end
