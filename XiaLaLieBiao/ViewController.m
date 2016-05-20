//
//  ViewController.m
//  XiaLaLieBiao
//
//  Created by Apple on 16/5/20.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL isHidden;
    CGRect menuFrame;
}
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UIView *backView;

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

#pragma mark -- 使用UIMenuItem
- (void)menu
{
    UIMenuItem *message = [[UIMenuItem alloc] initWithTitle:@"消息" action:@selector(messageClicked)];
    UIMenuItem *share = [[UIMenuItem alloc] initWithTitle:@"分享" action:@selector(shareClicked)];
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setMenuItems:[NSArray arrayWithObjects:message,share,nil]];
    [menu setTargetRect:self.view.bounds inView:self.view];
    [menu setMenuVisible:YES animated:YES];
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
//        [_button addTarget:self action:@selector(menu) forControlEvents:UIControlEventTouchUpInside];

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

- (UIView *)backView
{
    return _backView;
}

#pragma mark -- action
- (void)didButtonClicked
{
    isHidden = !isHidden;
    
    if (!isHidden)
    {
        [self tableView];
    }
    else
    {
        [_tableView removeFromSuperview];
    }
}

- (void)messageClicked
{
    
}

- (void)shareClicked
{
    
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(messageClicked))
    {
        return YES;
    }
    else if (action == @selector(shareClicked))
    {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
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
