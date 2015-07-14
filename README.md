TKRSegueOptions
==================

`TKRSegueOptions`'s new version `SegueContext` for Swift is [here](https://github.com/tokorom/SegueContext)!

You can pass the objects to destination view controller with UIStoryboardSegue.

## Do you have no complaints on the view controller transition now?

```objective-c
#import "NextViewController.h"
#import "ModalViewController.h"

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([@"Next" isEqualToString:segue.identifier]) {
        NextViewController *nextViewController = (NextViewController *)segue.destinationViewController;
        nextViewController.number = @1;
        [self.navigationController pushViewController:nextViewController animated:YES];
    } else if ([@"Modal" isEqualToString:segue.identifier]) {
        ModalViewController *modalViewController = (ModalViewController *)segue.destinationViewController;
        modalViewController.number = @2;
        [self.navigationController presentViewController:modalViewController animated:YES completion:nil];
    }
}
```

- You must import the view controller class of the transition destination...
- You must publish the public methods for pass the value...

**TKRSegueOptions will solve these problems!**

## Simple Usage

All you need to pass the values when the timing of the view controller transition.

- import at pch

```objective-c
#import "TKRSegueOptions.h"
```

- Source View Controller

```objective-c
[self performSegueWithIdentifier:@"Modal" options:@888];
```

-  Destination View Controller

```objective-c
self.label.text = self.segueOptions.stringValue; //< @"888"
```

## Other Usages

### pass the dictionary

```objective-c
// Source View Controller
NSDictionary *options = @{
    @"url": self.url,
    @"shop": self.shop,
};
[self performSegueWithIdentifier:@"Modal" options:options];

// Destination View Controller
NSURL *url = self.segueOptions[@"url"];
```

### If you want to do in a format that was more tight

```objective-c
// Source View Controller
CustomSegueOption *option = [CustomSegueOption new];
option.number = @888;
option.string = @"hello";
[self performSegueWithIdentifier:@"Modal" options:option];

// Destination View Controller
CustomSegueOption *option = (CustomSegueOption *)presentedViewController.segueOptions;
NSLog(@"number: %@, string: %@", option.number, option.string);
```

### If you can not use performSegue (For example Container View)

```objective-c
// Implement this method in source view controller
- (TKRSegueOptionSetting *)segueOptionSetting
{
    __weak typeof(self) wself = self;
    return [TKRSegueOptionSetting settingWithDictionary:@{
        @"Embed1": ^{
            return wself.leftLabel.text;
        },
        @"Embed2": ^{
            return wself.rightLabel.text;
        },
    }];
}
```

- key is UIStoryboard's identifier
- value is block that returns the you want to pass to the transition destination

### If you want to use a Custom Segue

```objective-c
@implementation CustomSegue

- (void)perform
{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *viewController;
    viewController = [sourceViewController.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];

    // you can use `takeOverSegueOptionsFromViewController:`
    [viewController takeOverSegueOptionsFromViewController:self.destinationViewController];

    [self.sourceViewController presentViewController:viewController animated:YES completion:nil];
}
    
@end
```

## Supplement

- If you implement `prepareForSegue:sender:`

```objective-c
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  // You must call the super
  [super prepareForSegue:segue sender:sender];

  // Your codes ...
}
```

## Swift Samples

- Source View Controller

```swift
self.performSegueWithIdentifier("Modal", options: ["title": "TITLE"])
```

-  Destination View Controller

```swift
if let title = self.segueOptions?["title"] as? NSString {
  self.label.text = title //< "TITLE"
}
```

## More information

- [日本語での紹介記事](http://www.tokoro.me/2014/04/12/improve-storyboard-segue/)
