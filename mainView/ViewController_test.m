//
//  ViewController_test.m
//  Bboylife
//
//  Created by zhangFan on 14-2-28.
//  Copyright (c) 2014年 leelen. All rights reserved.
//

#import "ViewController_test.h"

@interface ViewController_test ()

@end

@implementation ViewController_test

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
//	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"根视图" style:UIBarButtonItemStyleDone target:nil action:nil];
//	
//	UIBarButtonItem * back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:nil action:nil];
//	self.navigationItem.backBarButtonItem = back ;
	
    [self.navigationController  setToolbarHidden:YES animated:YES];
	
//自定义动态创建toolBar
	UIBarButtonItem * toolItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
	
	bar = [[UIToolbar  alloc]initWithFrame:CGRectMake(0.0, self.view.frame.size.height - bar.frame.size.height-44, self.view.frame.size.width, 44)];
	[bar setBarStyle: UIBarStyleDefault ];
    bar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
	[bar setItems:[NSArray  arrayWithObject: toolItem]];
	[self.view  addSubview: bar];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
