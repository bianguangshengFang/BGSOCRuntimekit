//
//  TestClass.h
//  BGSOcRuntimeDemo
//
//  Created by bianguangsheng on 2017/3/10.
//  Copyright © 2017年 soufunnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject<NSCoding,NSCopying>
@property (nonatomic,strong)NSArray *publickProperty1;
@property (nonatomic,strong)NSString *publicProperty2;
+(void)classMethod:(NSString *)value;
- (void) publicTestMethod1:(NSString *)value1 Second:(NSString *)value2 ;
- (void)publickTestMethod2;
- (void)method1;
- (void)method2;
-(void)method3;

@end
