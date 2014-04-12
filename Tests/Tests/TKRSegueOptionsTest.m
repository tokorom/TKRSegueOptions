//
//  TKRSegueOptionsTest.m
//
//  Created by ToKoRo on 2014-04-11.
//

//----------------------------------------------------------------------------//
#pragma mark - CustomSegueOption
//----------------------------------------------------------------------------//

@interface CustomSegueOption : TKRSegueOption
@property (strong) NSNumber *number;
@property (strong) NSString *string;
@end 

@implementation CustomSegueOption
@end

//----------------------------------------------------------------------------//
#pragma mark - TKRSegueOptionsTest
//----------------------------------------------------------------------------//

@interface TKRSegueOptionsTest : XCTestCase
@property (strong) UIViewController *startViewController;
@end 

@implementation TKRSegueOptionsTest

- (void)setUp
{
    [super setUp];

    UIViewController *viewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        self.startViewController = [[(UINavigationController *)viewController viewControllers] firstObject];
    }  else {
        self.startViewController = viewController;
    }
    expect(self.startViewController).toNot.beNil();
}

- (void)tearDown
{
    [super tearDown];

    [self.startViewController.navigationController popToRootViewControllerAnimated:NO];
    [self.startViewController dismissViewControllerAnimated:NO completion:nil];
}

- (void)testModalSegue
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Modal" options:@10];

    UIViewController *presentedViewController = viewController.presentedViewController;
    expect(presentedViewController.segueOptions.numberValue).to.equal(@10);
}

- (void)testPushSegue
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Push" options:@"GO"];

    UIViewController *presentedViewController = viewController.navigationController.viewControllers.lastObject;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions.stringValue).to.equal(@"GO");
}

- (void)testCustomSegue
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Custom" options:@{@"key": @"value"}];

    UIViewController *presentedViewController = viewController.navigationController.viewControllers.lastObject;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions[@"key"]).to.equal(@"value");
}

- (void)testToNavigationController
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Navigation" options:@100];

    UINavigationController *navigationController = (UINavigationController *)viewController.presentedViewController;
    expect(navigationController).to.beKindOf(UINavigationController.class);
    UIViewController *presentedViewController = navigationController.viewControllers.lastObject;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions.integerValue).to.equal(100);
}

- (void)testToTabController
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Tab" options:@100];

    UITabBarController *tabBarController = (UITabBarController *)viewController.presentedViewController;
    expect(tabBarController).to.beKindOf(UITabBarController.class);
    for (UIViewController *viewController in tabBarController.viewControllers) {
        expect(viewController).toNot.beNil();
        expect(viewController.segueOptions.floatValue).to.equal(100.0f);
    }
}

- (void)testSegueOptionWithArray
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Modal" options:@[@1, @2, @3]];

    UIViewController *presentedViewController = viewController.presentedViewController;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions[1]).to.equal(@2);
}

- (void)testSegueOptionWithObject
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Modal" options:@[@1, @2, @3]];

    UIViewController *presentedViewController = viewController.presentedViewController;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions.value).to.equal(@[@1, @2, @3]);
}

- (void)testSegueOptionWithSegueOption
{
    UIViewController *viewController = self.startViewController;
    TKRSegueOption *option = [TKRSegueOption optionWithObject:@5];
    [viewController performSegueWithIdentifier:@"Modal" options:option];

    UIViewController *presentedViewController = viewController.presentedViewController;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions.value).to.equal(@5);
}

- (void)testSegueOptionWithCustomSegueOption
{
    UIViewController *viewController = self.startViewController;
    CustomSegueOption *option = [CustomSegueOption new];
    option.number = @888;
    option.string = @"hello";
    [viewController performSegueWithIdentifier:@"Modal" options:option];

    UIViewController *presentedViewController = viewController.presentedViewController;
    expect(presentedViewController).toNot.beNil();
    option = (CustomSegueOption *)presentedViewController.segueOptions;
    expect(option.number).to.equal(@888);
    expect(option.string).to.equal(@"hello");
}

- (void)testSegueOptionSetting
{
    UIViewController *viewController = self.startViewController;
    UIViewController *embeddedViewController = viewController.childViewControllers.firstObject;
    expect(embeddedViewController).toNot.beNil();
    expect(embeddedViewController.segueOptions.doubleValue).to.equal(55.5);
}

@end
