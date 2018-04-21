//
//  KeyboardViewController.m
//  notification
//
//  Created by Mike Cameron on 2018-04-21.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewBottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (nonatomic, readonly) CGFloat oldConstraint;

@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _oldConstraint = self.viewBottomConstraint.constant;
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
}

// override the setter on the layoutconstraint

-(void)keyboardDidChange:(NSNotification*)notification{
    NSDictionary *myDict = notification.userInfo;
    NSLog(@"%@", myDict);
    NSValue *startVal = myDict[UIKeyboardFrameBeginUserInfoKey];
    NSValue *endVal = myDict[UIKeyboardFrameEndUserInfoKey];
    CGRect startRect = startVal.CGRectValue;
    CGRect endRect = endVal.CGRectValue;
    CGFloat startY = startRect.origin.y;
    CGFloat endY = endRect.origin.y;
    CGFloat point = endRect.size.height;
    if (startY > endY) {
        self.viewBottomConstraint.constant = self.viewBottomConstraint.constant + point;
    } else if (endY > startY) {
        self.viewBottomConstraint.constant = self.oldConstraint;
    }

}

- (IBAction)redWasTapped:(UITapGestureRecognizer *)sender {
    [self.myTextField resignFirstResponder];
    NSLog(@"tapped");
//    self.viewBottomConstraint.constant = self.oldConstraint;
}

@end
