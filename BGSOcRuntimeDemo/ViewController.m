//
//  ViewController.m
//  BGSOcRuntimeDemo
//
//  Created by bianguangsheng on 2017/3/10.
//  Copyright © 2017年 soufunnet. All rights reserved.
//

#import "ViewController.h"
#import "BGSRuntimeKit.h"
#import "TestClass.h"
#import "TestClass+AdddynamaticProperty.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //bgsruntime.kit 用法
    //获取变量列表
    NSArray *varlist=[BGSRuntimeKit fetchIvarList:[TestClass class]];
    NSLog(@"varlist:%@",varlist);
    //获取属性列表
    NSArray *propertyList=[BGSRuntimeKit fetchPropertyList:[TestClass class]];
    NSLog(@"propertyList:%@",propertyList);
    //获取属性类型列表
    NSArray *propertypeList=[BGSRuntimeKit fetchPropertyTypeList:[TestClass class]];
    NSLog(@"prppertypeList:%@",propertypeList);
    //获取协议列表
        NSArray *protocolList=[BGSRuntimeKit fetchProtocolList:[TestClass class]];
    NSLog(@"protocolist:%@",protocolList);
    //为testClass 类动态添加logNihao方法
    [BGSRuntimeKit addMethod:[TestClass class] method:@selector(logNihao) ImpMethod:@selector(impNiHao)];
    //获取方法列表，查看打印方法列表
    NSArray *methodlist=[BGSRuntimeKit fetchMethodList:[TestClass class]];
    NSLog(@"methodlist:%@",methodlist);
    TestClass *test=[[TestClass alloc]init];
    //动态交换方法
    [BGSRuntimeKit methodSwap:[TestClass class] firstMethod:@selector(method1)  SecondMethod:@selector(method2)];
    [test method1];
    [test method2];
    
//    [test  method3];
//    test.dynamaticProperty=@"haha";
//    NSLog(@"test.dynamaticPropery:%@",test.dynamaticProperty);
    //动态添加方法并拦截崩溃方法。
   [test performSelector:@selector(secondTest) withObject:nil];
    
    
    
    
    
    
    
}
+(void)method4 {
    
}
- (void)logNihao{
    NSLog(@"nihao");
}
- (void)impNiHao{
    NSLog(@"implationNihao");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
