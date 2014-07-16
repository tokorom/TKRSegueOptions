//
//  UIViewController+SegueOptions.h
//
//  Created by ToKoRo on 2014-04-09.
//

#import "TKRSegueOption.h"
#import "TKRSegueOptionSetting.h"

@interface UIViewController (SegueOptions)

@property (readonly) TKRSegueOption *segueOptions;

- (void)performSegueWithIdentifier:(NSString *)identifier options:(id)options;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender options:(id)options;

- (void)takeOverSegueOptionsFromViewController:(UIViewController *)viewController;

// Please override this method if you need
- (TKRSegueOptionSetting *)segueOptionSetting;
- (id)segueOptionsForSegue:(UIStoryboardSegue *)segue;

@end
