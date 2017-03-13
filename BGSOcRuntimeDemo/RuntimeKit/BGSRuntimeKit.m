//
//  BGSRuntimeKit.m
//  BGSOcRuntimeDemo
//
//  Created by bianguangsheng on 2017/3/10.
//  Copyright © 2017年 soufunnet. All rights reserved.
//

#import "BGSRuntimeKit.h"
#import <UIKit/UIKit.h>

@implementation BGSRuntimeKit
+ (NSString *)fetchClassName:(Class)cls  {
    const char *className=class_getName(cls);
    NSString *clsName=[NSString stringWithUTF8String:className];
    return clsName;
}

+(NSArray *)fetchIvarList:(Class)class {
    unsigned int outCount =0;
    NSArray *varListArray;
    NSMutableArray *mListArray=[NSMutableArray array];
    Ivar *ivarList=class_copyIvarList(class, &outCount);
    for (int i=0; i<outCount; i++) {
        const char *ivarName=ivar_getName(ivarList[i]);
        const char *ivarType=ivar_getTypeEncoding(ivarList[i]);
        NSMutableDictionary *ivarListDic=[[NSMutableDictionary alloc]initWithCapacity:outCount];
        [ivarListDic setObject:[NSString stringWithUTF8String:ivarName] forKey:@"name"];
        [ivarListDic setObject:[NSString stringWithUTF8String:ivarType] forKey:@"type"];
        [mListArray addObject:ivarListDic];
    }
    varListArray=[mListArray copy];
    return varListArray;
}
+(NSArray *)fetchPropertyList:(Class)cls {
    NSArray *propertyListArray;
    unsigned int outcount=0;
    objc_property_t *propertyList=class_copyPropertyList(cls, &outcount);
    
    NSMutableArray *mutableList=[NSMutableArray arrayWithCapacity:outcount];
    for (int i=0; i<outcount; i++) {
        const char *propertyName=property_getName(propertyList[i]);
        
        [mutableList addObject:[NSString stringWithUTF8String:propertyName]];
        
    }
    propertyListArray=[mutableList copy];
    free(propertyList);
    return propertyListArray;
    
}
+(NSArray *)fetchPropertyTypeList:(Class)cls{
       unsigned int outcount=0;
    objc_property_t *propertyList=class_copyPropertyList(cls, &outcount);
    NSMutableArray *marray=[NSMutableArray arrayWithCapacity:outcount];

    for (int i=0; i<outcount; i++) {
        const char *propertyAttributes=property_getAttributes(propertyList[i]);
        NSString *attributes=[NSString stringWithUTF8String:propertyAttributes];
        NSLog(@"attributes:%@",attributes);
        NSMutableString *mattributes=[NSMutableString stringWithString:attributes];
        
        NSArray *componentArray=[mattributes componentsSeparatedByString:@","];
        NSString *firstTypeWord=componentArray[0];
        NSString *type=@"";
        NSLog(@"firstTypeWord:%@",firstTypeWord);
        if ([firstTypeWord containsString:@"@"]) {
            NSMutableString *mtypeStr=[NSMutableString stringWithString:firstTypeWord];
            NSArray *compsArray=[mtypeStr componentsSeparatedByString:@"\""];
            type=compsArray[1];
            NSLog(@"type:%@",type);
            
        }else{
            NSString   *typeShort=[firstTypeWord substringFromIndex:1];
            if ([typeShort isEqualToString:@"i"]) {
                type=@"int";
            }
            else if ([typeShort isEqualToString:@"B"]){
                type=@"BOOL";
            }
            else if ([typeShort isEqualToString:@"f"]){
                type=@"float";
            }
            else if ([typeShort isEqualToString:@"d"]){
                type=@"double";
            }
            else if ([typeShort isEqualToString:@"q"]){
                type=@"NSInteger";
            }
            else {
                type=@"not know type";
            }
            
        }
        
        NSLog(@"type:%@",type);
        [marray addObject:type];


    }
    free(propertyList);
    return [marray copy];
    }


+ (NSArray *)fetchMethodList:(Class)cls {
    unsigned int outcount=0;
    Method *mothodList=class_copyMethodList(cls, &outcount);
    NSMutableArray *methodNameArry=[NSMutableArray arrayWithCapacity:outcount];
    for (int i=0; i<outcount; i++) {
        Method m=mothodList[i];
        SEL methodName=method_getName(m);
        [methodNameArry addObject:NSStringFromSelector(methodName)];
    }
    free(mothodList);
    return [methodNameArry copy];
}

+ (NSArray *)fetchProtocolList:(Class)cls {
    unsigned int count=0;
    __unsafe_unretained Protocol **protocolList=class_copyProtocolList(cls, &count);
    NSMutableArray *protocolArray=[NSMutableArray arrayWithCapacity:count];
    for (int i=0; i<count; i++) {
        Protocol *protocol=protocolList[i];
        const char *protocolName=protocol_getName(protocol);
        [protocolArray addObject:[NSString stringWithUTF8String:protocolName]];
        
    }
    free(protocolList);
    return [protocolArray copy];
    
}

+ (void)addMethod: (Class)class  method:(SEL)methodSel ImpMethod:(SEL)impMethod {
    BOOL tag=NO;
    Method method=class_getInstanceMethod(class, impMethod);
    IMP methodImp=method_getImplementation(method);
    const char *type=method_getTypeEncoding(method);
   tag=class_addMethod(class, methodSel, methodImp, type);
    if (tag) {
        NSLog(@"addmethod successly");
       
        
    }else{
        NSLog(@"has the same name implemation method");
    }

}

+ (void) methodSwap:(Class)cls firstMethod:(SEL)fM SecondMethod:(SEL)sM {
    Method firstMethod= class_getInstanceMethod(cls, fM);
    Method secondMethod=class_getInstanceMethod(cls, sM);
    method_exchangeImplementations(firstMethod, secondMethod);
}






@end
