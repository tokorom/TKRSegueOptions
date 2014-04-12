//
//  UIViewController+SegueOptions.h
//
//  Created by ToKoRo on 2014-04-09.
//

#import "TKRSegueOption.h"

@interface UIViewController (SegueOptions)

- (void)performSegueWithIdentifier:(NSString *)identifier options:(id)options;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender options:(id)options;

- (TKRSegueOption *)segueOptions;

@end
