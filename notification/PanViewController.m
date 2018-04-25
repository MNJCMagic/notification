//
//  PanViewController.m
//  notification
//
//  Created by Mike Cameron on 2018-04-22.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "PanViewController.h"
#import "PanView.h"
@interface PanViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet PanView *panView;



@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.panView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"help %@", change);
    if([keyPath isEqualToString:@"point"]){
        id value = change[NSKeyValueChangeNewKey];
        NSLog(@"value is %@", value);
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        NSLog(@"point is %@", NSStringFromCGPoint(point));
        
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellowView.center = newCenter;
    
    
    
    
}
}

    -(void)dealloc {
        [self.panView removeObserver:self forKeyPath:@"point" context:nil];
    }



@end
