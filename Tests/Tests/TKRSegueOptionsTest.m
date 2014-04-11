//
//  TKRSegueOptionsTest.m
//
//  Created by ToKoRo on 2014-04-11.
//

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

    UIViewController *presentedViewController = viewController.presentedViewController;
    expect(presentedViewController).toNot.beNil();
    expect(presentedViewController.segueOptions).to.equal(@10);
}

@end
