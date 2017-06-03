//
//  ViewController.m
//  OCSwift
//
//  Created by 田彬彬 on 2017/6/3.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

#import "ViewController.h"

//#import "UIButton+TBCustom.h"  oc 第二种方式
#import "OCSwift-Swift.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // oc 第一种
    [self OC_StepOne];
    

    
    
    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(80, 250, 200, 100)];
    [btn2 setTitle:@"点击跳转到swift界面" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(TB_btnClickpsuh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

    
}

-(void)OC_StepOne{
    
    UIButton * btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(TB_btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}


-(void)TB_btnClick
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(PrintHelloWorld) object:nil];
    [self performSelector:@selector(PrintHelloWorld) withObject:nil afterDelay:.4];
}



-(void)PrintHelloWorld
{
    NSLog(@"点击了有延迟吗");
}


-(void)TB_btnClickpsuh
{
    [self.navigationController pushViewController:[[SWIFTViewController alloc]init] animated:YES];
}

@end
