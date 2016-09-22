//
//  Person.h
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

/**
 此部分代码只负责原始数据的获取，不能引入任何组件
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

@property(strong, nonatomic) RACSubject *onGetNewData;//数据跟新的信号📶,可以有多个信号📶，指向不同的事件处理结果

-(void)updateData;

@end
