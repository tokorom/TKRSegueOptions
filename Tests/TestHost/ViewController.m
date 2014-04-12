//
//  ViewController.m
//
//  Created by ToKoRo on 2014-04-11.
//

#import "ViewController.h"
#import "TKRSegueOptionSetting.h"

@implementation ViewController

//----------------------------------------------------------------------------//
#pragma mark - Lifecycle
//----------------------------------------------------------------------------//

- (TKRSegueOptionSetting *)segueOptionSetting
{
    return [TKRSegueOptionSetting settingWithDictionary:@{
        @"Embed": ^{
            return @55.5;
        },
    }];
}

@end
