//
//  UIViewController+SegueOptions.h
//
//  Created by ToKoRo on 2014-04-09.
//

@interface UIViewController (SegueOptions)

- (void)performSegueWithIdentifier:(NSString *)identifier options:(id)options;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender options:(id)options;

- (id)segueOptions;

@end
