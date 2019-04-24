//
//  ViewController.m
//  UISearchBarTest
//
//  Created by 王雪剑 on 2019/4/24.
//  Copyright © 2019年 zkml－wxj. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()<UISearchBarDelegate,NextViewControllerDelegate>
{
    UISearchBar *_searchBar;
    NSString *lastSearchText;
    UILabel *messageLabel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 300, 40)];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"请输入搜索的关键字";
    _searchBar.backgroundColor = [UIColor purpleColor];
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    [self.view addSubview:_searchBar];
    
    messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_searchBar.frame)+60, 300, 40)];
    messageLabel.text = @"需要刷新列表";
    messageLabel.backgroundColor = [UIColor cyanColor];
    messageLabel.hidden = YES;
    [self.view addSubview:messageLabel];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    if (searchBar.text.length == 0 && lastSearchText.length == 0) {
        messageLabel.hidden = YES;
        NextViewController *vc = [[NextViewController alloc]init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }else if (searchBar.text.length != 0 && lastSearchText.length != 0){
        messageLabel.hidden = YES;
        NextViewController *vc = [[NextViewController alloc]init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }else{
        messageLabel.hidden = NO;
        lastSearchText = nil;
        return NO;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_searchBar resignFirstResponder];
}

- (void)handleClick:(NSString *)str{
    _searchBar.text = str;
    lastSearchText = str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
