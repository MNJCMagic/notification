//
//  StepperViewController.m
//  notification
//
//  Created by Mike Cameron on 2018-04-21.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "StepperViewController.h"

@interface StepperViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic, assign) NSInteger stepperValue;

@end

@implementation StepperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.stepperValue = self.stepper.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperClicked:(UIStepper *)sender {
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSDictionary* stepperDict = [[NSDictionary alloc] initWithObjectsAndKeys:@(sender.value), @"stepperValue", nil];
    NSNotification *notification = [[NSNotification alloc] initWithName:@"checkStepperVal" object:nil userInfo:stepperDict];
    [notificationCenter postNotification:notification];
    
}

@end
