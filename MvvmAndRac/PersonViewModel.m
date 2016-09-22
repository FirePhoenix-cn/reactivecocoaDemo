//
//  PersonViewModel.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "PersonViewModel.h"
#import "Person.h"

@interface PersonViewModel()

@property(strong, nonatomic) Person *person;

@end

@implementation PersonViewModel

/**************************************************************
                           公共方法
 **************************************************************/
-(instancetype)initViewModel
{
    self = [self init];
    if (!self)
    {
        return nil;
    }
    [self analysisData];
    
    //订阅MODEL的信号🆕，也可以使用KVO
    @weakify(self)
    [self.person.onGetNewData subscribeNext:^(id x) {
        @strongify(self)
        [self analysisData];
    }];
    return self;
}

-(void)updateDataWithUrl:(NSString*)url
{
    [self.person updateData];
}


/**************************************************************
                             懒加载
 **************************************************************/
-(Person *)person
{
    if (!_person) {
        _person = [[Person alloc] init];
    }
    return _person;
}

-(RACSubject *)didUpdateData
{
    if (!_didUpdateData)
    {
        _didUpdateData = [[RACSubject alloc] init];
    }
    return _didUpdateData;
}

/**************************************************************
                            私有方法
 **************************************************************/
-(void)analysisData
{
    __weak Person *person = self.person;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    self.name = [NSString stringWithFormat:@"name:%@",person.name];
    self.age = [NSString stringWithFormat:@"age:%li",(long)person.age];
    self.birthdate = [NSString stringWithFormat:@"birth:%@",[formatter stringFromDate:person.birthdate]];
    self.sex = (person.ismale)?@"sex:man":@"sex:woman";
    self.height = [NSString stringWithFormat:@"height:%.1f M",person.height];
    self.weight = [NSString stringWithFormat:@"weight:%.1f M",person.weight];
    self.skill = [NSString stringWithFormat:@"skill:%@",person.skill];
    person = nil;
    
    //数据解析完成了，发出信号📶
    [self.didUpdateData sendNext:nil];
    
}


@end
