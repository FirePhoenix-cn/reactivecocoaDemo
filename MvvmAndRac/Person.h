//
//  Person.h
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

/**
 此部分代码只负责原始数据的获取
 */

#import "CYModel.h"

@interface Person : CYModel

@property(strong, nonatomic) NSString* name;

@property(assign, nonatomic) NSInteger age;

@property(strong, nonatomic) NSDate *birthdate;

@property(assign, nonatomic) CGFloat height;

@property(assign, nonatomic) CGFloat weight;

@property(assign, nonatomic) BOOL ismale;

@property(strong, nonatomic) NSData *skill;

@property(assign, nonatomic) id<CYModelProtocol> modelProtocol;

-(void)updateData;

@end
