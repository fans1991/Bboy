//
//  viewController_label.h
//  Bboylife
//
//  Created by zhangFan on 14-2-27.
//  Copyright (c) 2014年 leelen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController_test.h"

@interface viewController_label : UIViewController<UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>
{
	UITableView * danceTableView;
	NSMutableArray * danceArray;
	
	UIActivityViewController * activityVC;
}
@end
