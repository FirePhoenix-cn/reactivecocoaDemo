//
//  OtherDelegate.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/22.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "OtherDelegate.h"

@implementation OtherDelegate

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] otherStaticMethord];
    
    });
}

+(void)otherStaticMethord
{
    NSLog(@"OtherDelegate: otherStaticMethord");
}

@end
