//
//  TestClass+AdddynamaticProperty.m
//  BGSOcRuntimeDemo
//
//  Created by bianguangsheng on 2017/3/13.
//  Copyright © 2017年 soufunnet. All rights reserved.
//

#import "TestClass+AdddynamaticProperty.h"
#import "BGSRuntimeKit.h"
@implementation TestClass (AdddynamaticProperty)
static char kDynamicAddProperty;
- (NSString *)dynamaticProperty {
    return  objc_getAssociatedObject(self, &kDynamicAddProperty);
}
- (void)setDynamaticProperty:(NSString *)dynamaticProperty {
    
    objc_setAssociatedObject(self, &kDynamicAddProperty, dynamaticProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
