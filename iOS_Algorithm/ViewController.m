//
//  ViewController.m
//  iOS_Algorithm
//
//  Created by xixi on 2018/5/21.
//  Copyright © 2018年 xixi. All rights reserved.
//

#import "ViewController.h"

#import "Recursion.h"
#import "BigNumSum.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Recursion *re = [[Recursion alloc] init];
//    [re doSimpleRecursion:10];
//    [re doSimpleRecursion:20];
    [re doGoodRecursion:1000];
    
    BigNumSum *bs = [[BigNumSum alloc] init];
    NSLog(@"%@", [bs bigNumSun:@"827382732890883" secionNum:@"283262372959"]);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
