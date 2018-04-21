//
//  LabelViewController.m
//  notification
//
//  Created by Mike Cameron on 2018-04-21.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation LabelViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(changeLabel:) name:@"checkStepperVal" object:nil];
}

-(void)changeLabel:(NSNotification*)notification {
    NSDictionary *thisDict = notification.userInfo;
    NSNumber *thisNum = [thisDict valueForKey:@"stepperValue"];
    NSLog(@"%@", thisDict);
    self.countLabel.text = [NSString stringWithFormat:@"%@", thisNum];
}

-(void)dealloc {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}

@end
