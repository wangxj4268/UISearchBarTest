//
//  NextViewController.h
//  UISearchBarTest
//
//  Created by 王雪剑 on 2019/4/24.
//  Copyright © 2019年 zkml－wxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NextViewControllerDelegate<NSObject>
- (void)handleClick:(NSString *)str;
@end

@interface NextViewController : UIViewController

@property (nonatomic,weak)id<NextViewControllerDelegate> delegate;

@end
