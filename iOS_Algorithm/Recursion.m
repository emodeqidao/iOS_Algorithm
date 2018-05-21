//
//  Recursion.m
//  iOS_Algorithm
//
//  Created by xixi on 2018/5/21.
//  Copyright © 2018年 xixi. All rights reserved.
//

#import "Recursion.h"

@implementation Recursion


/**
 这个写法是有问题的，当数字越大的时候 所耗费的时间越多，所有要对这个算法进行优化，请看下面的goodRecursion
 这个不建议使用
 */
NSInteger simpleRecursion(NSInteger n)
{
    if (n < 1)
    {
        return -1;
    }
    if(n == 1 || n == 2)
    {
        return 1;
    }
    else
    {
        return simpleRecursion(n - 1) + simpleRecursion(n - 2);
    }
}

/** 经过改良的版本*/
NSInteger goodRecursion(NSInteger n)
{
    if (n < 1)
    {
        return -1;
    }
    if(n == 1 || n == 2)
    {
        return 1;
    }
    
    NSInteger i, s1 , s2;
    s1 = 1;
    s2 = 1;
    for (i = 3; i <= n; i++)
    {
        s2 = s1 + s2;
        s1 = s2 - s1;
    }
    return s2;
}

-(void) doSimpleRecursion:(NSInteger)targetInt
{
    NSLog(@"%zd", simpleRecursion(targetInt));
}

-(void) doGoodRecursion:(NSInteger)targetInt
{
    NSLog(@"%zd", goodRecursion(targetInt));
}

@end
