//
//  TestClass.m
//  BGSOcRuntimeDemo
//
//  Created by bianguangsheng on 2017/3/10.
//  Copyright © 2017年 soufunnet. All rights reserved.
//

#import "TestClass.h"
#import "RuntimeKit/BGSRuntimeKit.h"
#import "SecondTestClass.h"
#import <objc/message.h>
#import <objc/NSObjCRuntime.h>
@interface TestClass (){
    NSInteger _var1;
    int _var2;
    BOOL _var3;
    double _var4;
    float _var5;
}
@property (nonatomic,strong) NSMutableArray *privateProperty1;
@property (nonatomic,strong) NSNumber *privateProperty2;
@property (nonatomic,strong) NSDictionary *privateProperty3;
@property (nonatomic,assign) int privateProperty4;
@property (nonatomic,assign) BOOL privateProperty5;
@property (nonatomic,assign) float privateProperty6;
@property (nonatomic,assign) double privateproperty7;
@property (nonatomic,assign) NSInteger privateProperty8;
@end
@implementation TestClass
- (id)init {
    if (self=[super init]) {
        //
    }
    return self;
}
- (void)privateTestMethod1 {
    NSLog(@"privateTestMethod1");
}
- (void)privateTestMethod2 {
    NSLog(@"privateTestMethod2");
}
#pragma mark     ---方法交换的时候使用
- (void)method1 {
    NSLog(@"我是method1 的实现");
}
- (void)method2 {
    NSLog(@"我是method2 的实现");
}
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    return [SecondTestClass new];
    return self;// 转发给自己，由自己处理
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    //查找父类的方法签名
    NSMethodSignature *sig=[super methodSignatureForSelector:sel];
    if (sig==nil) {
        sig=[NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
    
    return  sig;
}
//转发给secondclass
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SecondTestClass *sec=[SecondTestClass new];
    SEL sel=anInvocation.selector;
    if ([sec respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:sec];
    }else{
        [self doesNotRecognizeSelector:sel];
    }
}
//+(BOOL)resolveInstanceMethod:(SEL)sel {
//    
//    NSLog(@"sel:%@",NSStringFromSelector(sel));
//        [BGSRuntimeKit addMethod:self method:sel ImpMethod:@selector(dynamicAddMethod:)];
//        return YES;
//        
//    
//}




- (void)dynamicAddMethod:(NSString *)value{
    NSLog(@"oc 的替换方法：%@",value);
}
void aaaa(id self, SEL _cmd, id param1)
{
    
    NSLog(@"调用eat %@ %@ %@",self,NSStringFromSelector(_cmd),param1);
}

@end
