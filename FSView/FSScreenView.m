//
//  FSScreenView.m
//  FSView
//
//  Created by gzlx on 2018/5/9.
//  Copyright © 2018年 gzlx. All rights reserved.
//

#import "FSScreenView.h"
//#import <UIKit/UIKit.h>

#define  kSCrWidth [UIScreen mainScreen].bounds.size.width
#define  kSCrHeight [UIScreen mainScreen].bounds.size.height

@interface FSScreenView()

@property (nonatomic, assign) CGPoint startPoint;

@end


@implementation FSScreenView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 40;
        
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        
    }
    return self;
}

- (void)panAction:(UIPanGestureRecognizer *)pan
{
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    CGPoint point = [pan locationInView:window];//相对于window的位置
//    CGPoint point1 = [pan translationInView:window];
//    CGPoint point2 = [pan velocityInView:window];
    //在拖动收拾触发的时候 began 记录一下开始的点 移动中的时候计算偏移量 然后一直赋值  结束的时候再次修改frame
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        [pan setTranslation:CGPointZero inView:window];
        self.startPoint = [pan translationInView:window];
    }else if (pan.state == UIGestureRecognizerStateChanged){
       
        CGPoint currentPoint = [pan translationInView:window];
        CGFloat offx = currentPoint.x - self.startPoint.x;
        CGFloat offY = currentPoint.y - self.startPoint.y;
        CGPoint centerPoint = CGPointMake(self.center.x + offx, self.center.y +offY);
        self.center = centerPoint;
        [pan setTranslation:CGPointZero inView:window];
    }else if (pan.state == UIGestureRecognizerStateEnded){
        CGFloat offx =self.frame.origin.x;
        CGFloat offY = self.frame.origin.y;
        if (offx < 0) {
            [UIView animateWithDuration:0.2 animations:^{
                self.center = CGPointMake(self.bounds.size.width /2, self.center.y);
            }];
        }
        
        if ((offx + self.bounds.size.width)> kSCrWidth ) {
            [UIView animateWithDuration:0.2 animations:^{
                self.center = CGPointMake(kSCrWidth - self.bounds.size.width / 2, self.center.y);
            }];
        }
        
        if ((offY + self.bounds.size.height)> kSCrHeight) {
            [UIView animateWithDuration:0.2 animations:^{
                self.center = CGPointMake(self.center.x, kSCrHeight - self.bounds.size.height / 2);
            }];
        }
        
        
        if (offY < 0) {
            [UIView animateWithDuration:0.2 animations:^{
                self.center = CGPointMake(self.center.x, self.bounds.size.width /2);
            }];
        }
        
        
        if (self.center.x >= kSCrWidth/ 2) {
            [UIView animateWithDuration:0.2 animations:^{
                self.center = CGPointMake(kSCrWidth - self.bounds.size.width / 2, self.center.y);
            }];
        }else{
            [UIView animateWithDuration:0.2 animations:^{
                self.center = CGPointMake(self.bounds.size.width / 2, self.center.y);
            }];
        }
        
    }
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
