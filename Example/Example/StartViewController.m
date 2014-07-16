//
//  StartViewController.m
//
//  Created by ToKoRo on 2014-04-12.
//

#import "StartViewController.h"

@interface StartViewController ()
@property (weak) IBOutlet UILabel *countLabel;
@property (weak) IBOutlet UILabel *leftLabel;
@property (weak) IBOutlet UILabel *rightLabel;
@end 

@implementation StartViewController

//----------------------------------------------------------------------------//
#pragma mark - View lifecycle
//----------------------------------------------------------------------------//

- (TKRSegueOptionSetting *)segueOptionSetting
{
    __weak typeof(self) wself = self;
    return [TKRSegueOptionSetting settingWithDictionary:@{
        @"Navigation": ^{
            return wself.countLabel.text;
        },
        @"Tab": ^{
            return wself.countLabel.text;
        },
        @"Embed1": ^{
            return wself.leftLabel.text;
        },
        @"Embed2": ^{
            return wself.rightLabel.text;
        },
        @"Custom": ^{
            return wself.countLabel.text;
        },
    }];
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
