//
//  StartViewController.m
//
//  Created by ToKoRo on 2014-04-12.
//

#import "StartViewController.h"

@interface StartViewController ()
@property (weak) IBOutlet UILabel *countLabel;
@end 

@implementation StartViewController

//----------------------------------------------------------------------------//
#pragma mark - View lifecycle
//----------------------------------------------------------------------------//

- (void)viewDidLoad
{
    [super viewDidLoad];

    TKRSegueOptionSetting *setting = [TKRSegueOptionSetting settingWithDictionary:@{
        @"Navigation": ^{
            return self.countLabel.text;
        },
        @"Tab": ^{
            return self.countLabel.text;
        },
    }];
    self.segueOptionSetting = setting;
}

//----------------------------------------------------------------------------//
#pragma mark - Actions
//----------------------------------------------------------------------------//

- (IBAction)backToStartViewControllerForUnwindSegue:(UIStoryboardSegue *)segue
{
}

- (IBAction)sliderDidChange:(UISlider *)slider
{
    NSInteger count = [@(slider.value) integerValue];
    self.countLabel.text = [@(count) stringValue];
}
    
@end
