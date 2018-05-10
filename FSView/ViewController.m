//
//  ViewController.m
//  FSView
//
//  Created by gzlx on 2018/5/9.
//  Copyright © 2018年 gzlx. All rights reserved.
//

#import "ViewController.h"
#import "FSScreenView.h"
#import "NSObject+FSName.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSObject * object = [[NSObject alloc] init];
    object.name = @"1234";
    NSLog(@"%@", object.name);
    
    
    
   FSScreenView * view = [[FSScreenView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [self.view addSubview:view];

    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
