//
//  Person.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "Person.h"

@implementation Person

/**************************************************************
                            公共方法
 **************************************************************/

-(void)updateData
{
    [self performSelector:@selector(didRecieveHttpData) withObject:nil afterDelay:1];
}

/**************************************************************
                            私有方法
 **************************************************************/

-(void)didRecieveHttpData
{
    self.birthdate = [[NSDate alloc] init];
    
    //数据获取到了，发出信号📶
    [self.onGetNewData sendNext:nil];
}

/**************************************************************
                            懒加载
 **************************************************************/

-(RACSubject *)onGetNewData
{
    if (!_onGetNewData) {
        _onGetNewData = [[RACSubject alloc] init];
    }
    return _onGetNewData;
}

@end
