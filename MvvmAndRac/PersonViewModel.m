//
//  PersonViewModel.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "PersonViewModel.h"
#import "Person.h"

@interface PersonViewModel()<CYModelProtocol>

@property(strong, nonatomic) Person *person;

@end

@implementation PersonViewModel

-(instancetype)initViewModel
{
    self = [self init];
    if (!self)
    {
        return nil;
    }
    Person *person = [[Person alloc] init];
    _person = person;
    _person.modelProtocol = self;
    _viewmodelProtocol = self;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _name = [NSString stringWithFormat:@"name:%@",_person.name];
    _age = [NSString stringWithFormat:@"age:%li",(long)_person.age];
    _birthdate = [NSString stringWithFormat:@"birth:%@",[formatter stringFromDate:_person.birthdate]];
    _sex = (_person.ismale)?@"sex:man":@"sex:woman";
    _height = [NSString stringWithFormat:@"height:%.1f M",_person.height];
    _weight = [NSString stringWithFormat:@"weight:%.1f M",_person.weight];
    _skill = [NSString stringWithFormat:@"skill:%@",_person.skill];
    return self;
}

-(void)analysisData
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _name = [NSString stringWithFormat:@"name:%@",_person.name];
    _age = [NSString stringWithFormat:@"age:%li",(long)_person.age];
    _birthdate = [NSString stringWithFormat:@"birth:%@",[formatter stringFromDate:_person.birthdate]];
    _sex = (_person.ismale)?@"sex:man":@"sex:woman";
    _height = [NSString stringWithFormat:@"height:%.1f M",_person.height];
    _weight = [NSString stringWithFormat:@"weight:%.1f M",_person.weight];
    _skill = [NSString stringWithFormat:@"skill:%@",_person.skill];
}

-(void)httpDidUpdateData:(id)data
{
    _person = data;
    [self analysisData];
}

-(void)updateDataWithUrl:(NSString*)url
{
    [_person updateData];
}

@end
