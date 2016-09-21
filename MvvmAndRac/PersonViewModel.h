//
//  PersonViewModel.h
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//


/**
 此部分代码与UI无关，只处理数据,可以引入model，不可以引入view
 */

#import "CYViewModel.h"


@interface PersonViewModel : CYViewModel

@property(strong, nonatomic, readonly) NSString* name;

@property(strong, nonatomic, readonly) NSString *age;

@property(strong, nonatomic, readonly) NSString *birthdate;

@property(strong, nonatomic, readonly) NSString *height;

@property(strong, nonatomic, readonly) NSString *weight;

@property(assign, nonatomic, readonly) NSString *sex;

@property(strong, nonatomic, readonly) NSString *skill;

@property(assign, nonatomic) id<CYViewModelProtocol> viewmodelProtocol;

-(instancetype)initViewModel;

-(void)updateDataWithUrl:(NSString*)url;

@end
