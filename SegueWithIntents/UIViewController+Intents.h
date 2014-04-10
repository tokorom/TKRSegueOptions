//
//  UIViewController+Intents.h
//
//  Created by ToKoRo on 2014-04-09.
//

@interface UIViewController (Intents)

- (void)performSegueWithIdentifier:(NSString *)identifier intent:(id)intent;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender intent:(id)intent;

- (id)intent;

@end
