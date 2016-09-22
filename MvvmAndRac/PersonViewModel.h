//
//  PersonViewModel.h
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//


/**
 此部分代码与UI无关，只处理数据,可以引入model，不可以引入view，是比较胖的部分
 */

#import "CYViewModel.h"


@interface PersonViewModel : CYViewModel

@property(strong, nonatomic) NSString* name;

@property(strong, nonatomic) NSString *age;

@property(strong, nonatomic) NSString *birthdate;

@property(strong, nonatomic) NSString *height;

@property(strong, nonatomic) NSString *weight;

@property(assign, nonatomic) NSString *sex;

@property(strong, nonatomic) NSString *skill;

@property(strong, nonatomic) RACSubject *didUpdateData;//数据解析完成信号📶,可以有多个信号📶，指向不同的事件处理结果

-(instancetype)initViewModel;

-(void)updateDataWithUrl:(NSString*)url;

@end
