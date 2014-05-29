//
//  ViewController.m
//  Bboylife
//
//  Created by zhangFan on 14-2-26.
//  Copyright (c) 2014年 leelen. All rights reserved.
//

#import "ViewController.h"

static int  screenHeight ;




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
///=====初始化判断屏幕尺寸
	if( [[UIScreen mainScreen]bounds].size.height == 568 )
	{
		screenHeight = 568 ;
	}
	else
	{
		screenHeight = 480 ;
	}
	NSString * plistPath = [[NSBundle mainBundle]pathForResource:@"pageList" ofType:@"plist"];
	pageArray = [[NSArray  alloc]initWithContentsOfFile:plistPath];
	
	[self initinterfaceUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
///=============================

-(void)initinterfaceUI
{
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		
	}
	
    pagecontrol = [[UIPageControl  alloc]initWithFrame:CGRectMake(0,screenHeight-50, 320, 40)];
	pagecontrol.numberOfPages = [pageArray count];
	pagecontrol.currentPage = 0;
	[pagecontrol  addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    
	imageScrollControl = [[UIScrollView alloc]initWithFrame:self.view.frame];

	UIImageView * imageTemp ;
	for (int i= 0; i <[pageArray count]-1; i++)
	{
		imageTemp = [[UIImageView  alloc]initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, 320, screenHeight)];
		[imageTemp setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]]];
		[imageTemp setBackgroundColor:[UIColor clearColor]];
		[imageScrollControl addSubview:imageTemp];
	}
	
	imageView = [[UIImageView  alloc]initWithFrame:CGRectMake(320*4, 0, 320, screenHeight)];
	[imageView setImage: [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",7]]];
//	[imageView setBackgroundColor: [UIColor  clearColor]];
	imageView.userInteractionEnabled = YES ;
	[imageScrollControl addSubview: imageView];
	
	UIButton * btn = [UIButton  buttonWithType:UIButtonTypeCustom];
	[btn setFrame:CGRectMake(120, screenHeight-80, 80, 40)];
	[btn setTitle:@"开始体验" forState:UIControlStateNormal];
	[btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[btn  addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
	[imageView  addSubview:btn];

	imageScrollControl.delegate = self ;
	imageScrollControl.pagingEnabled = YES ;   /////
	[imageScrollControl setContentSize:CGSizeMake(320*pageArray.count, screenHeight)];

   	[self.view addSubview: imageScrollControl];
	[self.view addSubview: pagecontrol];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	CGFloat pageWidth = self.view.frame.size.width;
	//向下取整数floor（x）,不大于x的整数
	int  page = floor( (scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
//	NSLog(@"%d",page);
	
    [pagecontrol setCurrentPage:page];
	
///=========================
//	int index = fabs(scrollView.contentOffset.x) /scrollView.frame.size.width;
//		[pagecontrol setCurrentPage: index ] ;
}


-(void)pageTurn:(UIPageControl *)sender
{
	UIPageControl * control = (UIPageControl *)sender;
	int page = control.currentPage;
//	NSLog(@"%d",page) ;
	
	CGSize viewSize = imageScrollControl.frame.size;
    CGRect rect = CGRectMake(page* viewSize.width, 0, viewSize.width, viewSize.height);
    [imageScrollControl scrollRectToVisible:rect animated:YES];
}

///=== button  touch  start  new  life
-(void)btnClicked
{
	labelViewController = [[viewController_label alloc]initWithNibName:@"viewController_label" bundle:nil];
	labelViewController.title = @"Enjoy your life";
	
	mainNav = [[UINavigationController alloc]initWithRootViewController: labelViewController];
	mainNav.view.frame = CGRectMake(0.0, 0.0, 320.0, screenHeight);
    mainNav.view.backgroundColor = [UIColor darkGrayColor];
//	mainNav.navigationBarHidden = NO ;
//	mainNav.navigationItem.title = @"";
	
    [self.view addSubview:mainNav.view];
}

@end





