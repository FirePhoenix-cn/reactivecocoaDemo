//
//  SubView.m
//  MvvmAndRac
//
//  Created by jinou on 16/9/22.
//  Copyright © 2016年 qcy. All rights reserved.
//

#import "SubView.h"

@implementation SubView

- (IBAction)clickbtn:(id)sender
{
    [self.delegate clickButton:sender];
}

@end
