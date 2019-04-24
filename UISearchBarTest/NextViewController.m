//
//  NextViewController.m
//  UISearchBarTest
//
//  Created by 王雪剑 on 2019/4/24.
//  Copyright © 2019年 zkml－wxj. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()<UISearchBarDelegate>
{
    UISearchBar *_searchBar;
}
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self createView];
}

- (void)createView{
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 300, 40)];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"请输入搜索的关键字";
    _searchBar.backgroundColor = [UIColor purpleColor];
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    [self.view addSubview:_searchBar];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, CGRectGetMaxY(_searchBar.frame)+60, 300, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"返回上一级" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(handleClick:)]) {
        [self.delegate handleClick:@"123"];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
