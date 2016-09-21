//
//  PersonController.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "PersonController.h"
#import "PersonViewModel.h"

@interface PersonController ()

@property (strong ,nonatomic) PersonViewModel *viewModel;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *age;
@property (strong, nonatomic) IBOutlet UILabel *sex;
@property (strong, nonatomic) IBOutlet UILabel *birth;
@property (strong, nonatomic) IBOutlet UILabel *height;
@property (strong, nonatomic) IBOutlet UILabel *weight;
@property (strong, nonatomic) IBOutlet UILabel *skill;
- (IBAction)clickbutton:(UIButton *)sender;

@end

@implementation PersonController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _viewModel = [[PersonViewModel alloc] initViewModel];
    _name.text = _viewModel.name;
    _age.text = _viewModel.age;
    _sex.text = _viewModel.sex;
    _birth.text = _viewModel.birthdate;
    _height.text = _viewModel.height;
    _weight.text = _viewModel.weight;
    _skill.text = _viewModel.skill;
    
//    [_viewModel.name.rac_sequence.signal subscribeNext:^(id x) {
//        RACTuple *tuple = (RACTuple *)x;
//        NSLog(@"%@",tuple.allObjects);
//        _viewModel = [tuple objectAtIndex:0];
//        [self refreshUI];
//    }];
    
}

-(void)refreshUI
{
    _name.text = _viewModel.name;
    _age.text = _viewModel.age;
    _sex.text = _viewModel.sex;
    _birth.text = _viewModel.birthdate;
    _height.text = _viewModel.height;
    _weight.text = _viewModel.weight;
    _skill.text = _viewModel.skill;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)clickbutton:(UIButton *)sender
{
    [_viewModel updateDataWithUrl:nil];
}

@end
