//
//  PersonController.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/21.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "PersonController.h"
#import "PersonViewModel.h"
#import "SubView.h"

@interface PersonController ()<CYViewProtocol>

@property (strong ,nonatomic) PersonViewModel *viewModel;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *age;
@property (strong, nonatomic) IBOutlet UILabel *sex;
@property (strong, nonatomic) IBOutlet UILabel *birth;
@property (strong, nonatomic) IBOutlet UILabel *height;
@property (strong, nonatomic) IBOutlet UILabel *weight;
@property (strong, nonatomic) IBOutlet UILabel *skill;

@end

@implementation PersonController
/**************************************************************
                            系统方法
 **************************************************************/
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshUI];
    
    __weak SubView *sv = [[[NSBundle mainBundle] loadNibNamed:@"SubView" owner:self options:nil] lastObject];
    sv.delegate = self;
    [sv setFrame:CGRectMake((self.view.bounds.size.width - sv.bounds.size.width) *0.5,
                            self.view.bounds.size.height - sv.bounds.size.height,
                            sv.bounds.size.width, sv.bounds.size.height)];
    [self.view addSubview:sv];
    
    //订阅viewmodel的信号📶
    
    @weakify(self)
    [self.viewModel.didUpdateData subscribeNext:^(id x) {
        @strongify(self)
        [self refreshUI];

    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/**************************************************************
                            懒加载
 **************************************************************/

-(PersonViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[PersonViewModel alloc] initViewModel];
    }
    return _viewModel;
}
/**************************************************************
                            私有方法
 **************************************************************/

-(void)refreshUI
{
    __weak PersonViewModel *model = self.viewModel;
    self.name.text = model.name;
    self.age.text = model.age;
    self.sex.text = model.sex;
    self.birth.text = model.birthdate;
    self.height.text = model.height;
    self.weight.text = model.weight;
    self.skill.text = model.skill;
    model = nil;
}

/**************************************************************
                            代理协议
 **************************************************************/


-(void)clickButton:(id)sender
{
    [self.viewModel updateDataWithUrl:nil];
}

@end
