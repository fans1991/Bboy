//
//  ViewController.h
//  Bboylife
//
//  Created by zhangFan on 14-2-26.
//  Copyright (c) 2014年 leelen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "viewController_label.h"

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
	NSArray * pageArray ;
	UIScrollView *imageScrollControl;
	UIPageControl * pagecontrol ;
	
	UIImageView * imageView;  //最后一张图片进行显示
	
	UINavigationController *mainNav;
	viewController_label * labelViewController;
}

@end
