//
//  PanView.h
//  notification
//
//  Created by Mike Cameron on 2018-04-22.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanView : UIView
@property (nonatomic) CGPoint point;
@property (nonatomic) UIPanGestureRecognizer *panGestureRecognizer;
@end
