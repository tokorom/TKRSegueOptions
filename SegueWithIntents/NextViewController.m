//
//  NextViewController.m
//
//  Created by ToKoRo on 2014-04-09.
//

#import "NextViewController.h"
#import "UIViewController+Intents.h"

@interface NextViewController ()
@property (weak) IBOutlet UILabel *label;
@end 

@implementation NextViewController

//----------------------------------------------------------------------------//
#pragma mark - View lifecycle
//----------------------------------------------------------------------------//

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.label.text = [self.intent stringValue];
}

//----------------------------------------------------------------------------//
#pragma mark - IBAction
//----------------------------------------------------------------------------//
    
- (IBAction)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
