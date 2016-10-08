//
//  MasterViewController.m
//  test111
//
//  Created by BaiJiangzhou on 16/6/30.
//  Copyright © 2016年 Sohouer. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <SohouerSDK/SOHTaskSDK.h>
#import <SohouerSDK/SOHTaskListViewController.h>

@interface MasterViewController ()<SOHTaskSDKRegiseterDelegate,SOHTaskSDKLoginDelegate>

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    //初始化SDK，并注册用户
    [SOHTaskSDK setDebugMode:YES];
//    [SOHTaskSDK registerSDK:@"133698d1ccb2c2cd077f6d11e2520a85" appSecret:@"0cf3747ad26b4de5a943f35ad637023c" delegate:self];
    [SOHTaskSDK registerSDK:@"bd82e243a582a8ff1bad28988936f223" appSecret:@"14b148c4a7dbc1f56f335c1c91148d45" delegate:self];
    [SOHTaskSDK setNavgationTitleColor:[UIColor blueColor]];
    [SOHTaskSDK setNavgationBackColor:[UIColor blueColor]];
    [SOHTaskSDK setNavgationBGColor:[UIColor redColor]];
}

- (void) viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void) registerSuccess {
    NSLog(@"注册成功");
    //推荐：注册成功后，再登录
    
}

- (void) registerFailed:(NSString *)errorMessage {
    NSLog(@"注册失败");
}

- (void) loginSuccess {
    NSLog(@"登录成功");
}

- (void) loginFailed:(NSString *)errorMessage{
    NSLog(@"%@",errorMessage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if ([SOHTaskSDK isLogin]) {
        SOHTaskListViewController * listVC = [SOHTaskSDK taskListViewController];
        [self.navigationController pushViewController:listVC animated:YES];
    }else {
        [SOHTaskSDK login:@"123321" name:@"" delegate:self];
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
