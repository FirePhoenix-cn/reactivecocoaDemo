//
//  Person.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)updateData
{
    [self performSelector:@selector(didRecieveHttpData) withObject:nil afterDelay:2.0];
}

-(void)didRecieveHttpData
{
    self.name = @"123";
    [_modelProtocol httpDidUpdateData:self];
}

@end
