//
//  viewController_label.m
//  Bboylife
//
//  Created by zhangFan on 14-2-27.
//  Copyright (c) 2014年 leelen. All rights reserved.
//

#import "viewController_label.h"

@interface viewController_label ()

@end

@implementation viewController_label

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
	danceArray = [[NSMutableArray alloc]initWithObjects:@"Breaking",@"Poping",@"Locking",@"Hiphop",@"Jazz",@"Funky",nil];
	
	[self initTabBarViewController];
	[self initTabView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	
	[self.navigationController  setToolbarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma  mark --init
-(void)initTabBarViewController
{
	UIBarButtonItem * leftButtonItem = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barItem)];
	self.navigationItem.leftBarButtonItem = leftButtonItem ;
	
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(alertShow)];
	self.navigationItem.rightBarButtonItem = rightButtonItem;
	
	[self.navigationController  setToolbarHidden:NO animated:YES];
	
	
	UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareAllplatform)];
    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	
    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil]];
	
	
}


-(void)barItem
{
	ViewController_test * test = [[ViewController_test  alloc]initWithNibName:@"ViewController_test" bundle:nil];
	
    [self.navigationController pushViewController:test animated:YES];
//    test.title = @"Test View";
}


-(void)alertShow
{
	UIActionSheet * action = [[UIActionSheet  alloc]initWithTitle:@"dance style choose" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
	action.actionSheetStyle = UIActionSheetStyleBlackOpaque ;
	
	[action addButtonWithTitle:@"power"];
	[action addButtonWithTitle:@"style"];
	[action addButtonWithTitle:@"funky"];
	[action addButtonWithTitle:@"cancel"];
	
	action.cancelButtonIndex = action.numberOfButtons-1;
    
	[action showInView:self.view];
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"%@ ==  %d ",actionSheet.title,buttonIndex);
}

//初始化数据信息
-(void)initTabView
{
	danceTableView = [[UITableView  alloc]initWithFrame:CGRectMake(0.0, 0, self.view.frame.size.width,self.view.frame.size.height-88) style:UITableViewStylePlain];
	danceTableView.dataSource = self ;
	danceTableView.delegate  = self ;
	[self.view  addSubview:danceTableView];

//添加长按手势进行在常用功能界面的设备信息移动功能
	UILongPressGestureRecognizer * pressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
	[danceTableView addGestureRecognizer:pressGesture];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		UILabel *Datalabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 320, 44)];
		[Datalabel setTag:100];
		Datalabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[cell.contentView addSubview:Datalabel];
	}
	
	UILabel *Datalabel = (UILabel *)[cell.contentView viewWithTag:100];
	[Datalabel setFont:[UIFont boldSystemFontOfSize:18]];
	Datalabel.text = [danceArray objectAtIndex:[indexPath row]];
	if (cell.selected)
	{
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	else
	{
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
//	[cell.imageView setImage:[UIImage imageNamed:@"1.jpg"]];
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return  1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return  danceArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	return  YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
	NSInteger  fromRow = [sourceIndexPath row];
	NSInteger  toRow =  [destinationIndexPath row];
	[danceArray exchangeObjectAtIndex:fromRow withObjectAtIndex:toRow];
	[danceTableView setEditing:NO animated:NO];
}

#pragma mark --LongPressGesture

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
	if( gesture.state == UIGestureRecognizerStateBegan )
	{
		CGPoint  point = [gesture locationInView:danceTableView];
		NSIndexPath * indexPath = [danceTableView indexPathForRowAtPoint:point];
        if(indexPath == nil)
			return ;
		else    //可编辑移动
			[danceTableView setEditing:YES animated:NO];
	}
	
}

//-(void)didReceiveMemoryWarning
//{
//	[super didReceiveMemoryWarning];
//}



-(void)shareAllplatform
{
	
	NSArray * activity = [[NSArray alloc]initWithObjects:@"my style",nil];
	
	NSArray * activityItems = [[NSArray alloc]initWithObjects:@"first",@"second", nil];
	
	UIActivityViewController * activityVC =[[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:activity];
	
	UIActivityViewControllerCompletionHandler myBlock = ^(NSString *activityType,BOOL completed)
	{
		NSLog(@"%@",activityType);
		if( completed )
		{}
		else
		{}
		
		[activityVC dismissViewControllerAnimated:YES completion: nil];
	};
	
	activityVC.completionHandler = myBlock ;
	
	
	[self presentViewController: activityVC animated:YES completion:nil];
	
	
}


@end
