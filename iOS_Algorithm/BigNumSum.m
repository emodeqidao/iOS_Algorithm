//
//  BigNumAdd.m
//  iOS_Algorithm
//
//  Created by xixi_wen on 2019/10/15.
//  Copyright © 2019 xixi. All rights reserved.
//

#import "BigNumSum.h"

@implementation BigNumSum

-(NSString *) bigNumSun:(NSString *)firstNumStr secionNum:(NSString *)secondNumStr
{
    if (![self isNumber:firstNumStr] || ![self isNumber:secondNumStr])
    {
        return @"请传入数字";
    }
    
    //找出最大位数长度
    NSInteger maxLenth = firstNumStr.length > secondNumStr.length ? firstNumStr.length : secondNumStr.length;
    
    NSMutableArray *firstArray = [self arrayWithCapacity:maxLenth + 1];
    //将第一个数值 拆分每个字符到 数组
    for (int i = 0; i < firstNumStr.length; i++)
    {
        unichar ch = [firstNumStr characterAtIndex:(firstNumStr.length - 1 - i)];
        firstArray[i] = [NSNumber numberWithInteger:[[NSString stringWithFormat:@"%C", ch] integerValue]];
    }

    
    NSMutableArray *secondArray = [self arrayWithCapacity:maxLenth + 1];
    //将第二个数值 拆分每个字符到 数组
    for (int i = 0; i < secondNumStr.length; i++)
    {
        unichar ch = [secondNumStr characterAtIndex:(secondNumStr.length - 1 - i)];
        secondArray[i] = [NSNumber numberWithInteger:[[NSString stringWithFormat:@"%C", ch] integerValue]];
    }
    
    //存放相加结果
    NSMutableArray *resultArray = [self arrayWithCapacity:maxLenth + 1];
                         
    //相加
    for (NSInteger i = 0; i < maxLenth; i++)
    {
        NSInteger tempInt = 0;
        tempInt = [resultArray[i] integerValue];
        tempInt += [firstArray[i] integerValue];
        tempInt += [secondArray[i] integerValue];
        
        //如果相加大于10 则进一位
        if (tempInt > 10)
        {
            tempInt = tempInt - 10;
            resultArray[i + 1] = @(1);
        }
        resultArray[i] = @(tempInt);
    }
    
    //将数组反转
    NSMutableArray *newArray = (NSMutableArray *)[[resultArray reverseObjectEnumerator] allObjects];
    
    if ([[newArray firstObject] integerValue] == 0)
    {
        [newArray removeObjectAtIndex:0];
    }
    
    NSString *resultStr = [newArray componentsJoinedByString:@""];
    
    return resultStr;
}


-(NSMutableArray *) arrayWithCapacity:(NSInteger)maxLenth
{
    //预设里面的元素都是 0
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:maxLenth];
    for (int i = 0; i < maxLenth; i++)
    {
        [arr addObject:@(0)];
    }
    
    return arr;
}


- (BOOL)isNumber:(NSString *)string
{
    if (string == nil || [string length] <= 0)
    {
        return NO;
    }
     //  0123456789.
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    if (![string isEqualToString:filtered])
    {
        return NO;
    }
    return YES;
}

@end
