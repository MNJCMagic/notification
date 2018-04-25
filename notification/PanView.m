//
//  PanView.m
//  notification
//
//  Created by Mike Cameron on 2018-04-22.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "PanView.h"


@implementation PanView

- (IBAction)panRecognizer:(UIPanGestureRecognizer*)sender {
    NSLog(@"panned");
    CGPoint cgPoint = [sender translationInView:sender.view];
    self.point = cgPoint;
    [sender setTranslation:CGPointZero inView:sender.view];
    
}






@end
