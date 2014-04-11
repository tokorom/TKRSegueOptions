//
//  TKRSegueOptionsTest.m
//
//  Created by ToKoRo on 2014-04-11.
//

//----------------------------------------------------------------------------//
#pragma mark - UIViewController
//----------------------------------------------------------------------------//

@interface UIViewController (Tests)
- (void)viewDidAppear:(BOOL)animated;
@end

@implementation UIViewController (Tests)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)viewDidAppear:(BOOL)animated
{
    [TKRGuard resumeForKey:@"viewDidAppear"];
}

#pragma clang diagnostic pop

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

    self.startViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    expect(self.startViewController).toNot.beNil();
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testModalSegue
{
    UIViewController *viewController = self.startViewController;
    [viewController performSegueWithIdentifier:@"Modal" options:@10];

    XCTAssertNotNil([UIApplication sharedApplication]);
    XCTAssertNotNil([[UIApplication sharedApplication] keyWindow]);
    XCTAssertNotNil([[[UIApplication sharedApplication] keyWindow] rootViewController]);

/*     [TKRGuard waitWithTimeout:1.0 forKey:@"viewDidAppear"]; */
    UIViewController *presentedViewController = viewController.presentedViewController;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions).to.equal(@10);
}

@end
