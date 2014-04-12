//
//  ViewController.m
//  Example
//
//  Created by ytokoro on 4/12/14.
//  Copyright (c) 2014 tokoro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.label.text = self.segueOptions.stringValue;
}

@end
