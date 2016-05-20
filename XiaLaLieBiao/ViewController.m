//
//  ViewController.m
//  XiaLaLieBiao
//
//  Created by Apple on 16/5/20.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isHidden;
@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self button];
    [self array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- setter
- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(100, 100, 40, 40);
        [_button setTitle:@"➕" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(didButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_button];
    }
    return _button;
}

- (UITableView *)tableView
{
    CGRect frame = CGRectMake(_button.frame.origin.x - 40, _button.frame.origin.y + 40, 80, 120);
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_tableView];
    return _tableView;
}

- (NSArray *)array
{
    if (!_array)
    {
        _array = [[NSArray alloc] init];
        _array = @[@"第一行",@"第二行",@"第三行"];
    }
    return _array;
}

#pragma mark -- action
- (void)didButtonClicked
{
    _isHidden = !_isHidden;
    
    if (!_isHidden)
    {
        [self tableView];
    }
    else
    {
        [_tableView removeFromSuperview];
    }
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect frame = CGRectMake(0, 0, 80, 20);
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:frame];
    cell.textLabel.text = _array[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%lu",indexPath.row);
}

@end
