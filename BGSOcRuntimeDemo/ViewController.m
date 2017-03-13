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
//    NSArray *varlist=[BGSRuntimeKit fetchIvarList:[TestClass class]];
//    NSLog(@"varlist:%@",varlist);
//    
//    NSArray *propertyList=[BGSRuntimeKit fetchPropertyList:[TestClass class]];
//    NSLog(@"propertyList:%@",propertyList);
//    NSArray *propertypeList=[BGSRuntimeKit fetchPropertyTypeList:[TestClass class]];
//    NSLog(@"prppertypeList:%@",propertypeList);
//        NSArray *protocolList=[BGSRuntimeKit fetchProtocolList:[TestClass class]];
//    NSLog(@"protocolist:%@",protocolList);
//    [BGSRuntimeKit addMethod:[TestClass class] method:@selector(logNihao) ImpMethod:@selector(impNiHao)];
//    
//    NSArray *methodlist=[BGSRuntimeKit fetchMethodList:[TestClass class]];
//    NSLog(@"methodlist:%@",methodlist);
//    TestClass *test=[[TestClass alloc]init];
//    
//    [BGSRuntimeKit methodSwap:[TestClass class] firstMethod:@selector(method1)  SecondMethod:@selector(method2)];
//    [test method1];
//    [test method2];
    TestClass *test=[[TestClass alloc]init];
//    [test  method3];
//    test.dynamaticProperty=@"haha";
//    NSLog(@"test.dynamaticPropery:%@",test.dynamaticProperty);
    //动态添加方法
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
