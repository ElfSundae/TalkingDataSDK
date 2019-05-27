//
//  TDTableViewController.m
//  TalkingDataSDKDemo
//
//  Created by liweiqiang on 2017/8/1.
//  Copyright © 2017年 TendCloud. All rights reserved.
//

#import "TDTableViewController.h"

@interface TDTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (nonatomic) NSInteger showIndex;

@end

@implementation TDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.navigationItem.title hasPrefix:@"App Analytics"]) {
        self.items = @[
            @{@"id":@"DeviceID",@"height":@84,@"title":@"获取TDID"},
            @{@"id":@"Exception",@"height":@46,@"title":@"测试应用崩溃（点击后该Demo将闪退）"},
            @{@"id":@"Location",@"height":@46,@"title":@"设置经纬度"},
            @{@"id":@"Account",@"height":@236,@"title":@"账户接口"},
        ];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_showIndex == section) {
        return 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = [NSString stringWithFormat:@"%@Cell", [[self.items objectAtIndex:indexPath.section] objectForKey:@"id"]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[[self.items objectAtIndex:indexPath.section] objectForKey:@"height"] floatValue];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *identifier = [NSString stringWithFormat:@"Header-%ld", section];
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (view) {
        return view;
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 1366, 30)];
    button.tag = section;
    [button addTarget:self action:@selector(changeSection:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor colorWithWhite:242.0/255.0 alpha:1.0]];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 0)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    NSString *title = [[self.items objectAtIndex:section] objectForKey:@"title"];
    [button setTitle:title forState:UIControlStateNormal];
    
    view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:identifier];
    [view.contentView addSubview:button];
    
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.0f) {
        return nil;
    }
    
    NSString *identifier = [NSString stringWithFormat:@"Footer-%ld", section];
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (view) {
        return view;
    }
    
    view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:identifier];
    view.contentView.backgroundColor = [UIColor whiteColor];
    
    return view;
}

#pragma mark - Button event

- (void)changeSection:(UIButton *)sender {
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    if (_showIndex == -1) {
        _showIndex = sender.tag;
    } else if (_showIndex == sender.tag) {
        _showIndex = -1;
    } else {
        [indexSet addIndex:_showIndex];
        _showIndex = sender.tag;
    }
    [indexSet addIndex:sender.tag];
    
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.0f) {
        [self.tableView reloadData];
    } else {
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
