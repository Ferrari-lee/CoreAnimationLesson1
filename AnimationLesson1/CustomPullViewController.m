//
//  CustomPullViewController.m
//  AnimationLesson1
//
//  Created by 臧其龙 on 14/12/21.
//  Copyright (c) 2014年 臧其龙. All rights reserved.
//

#import "CustomPullViewController.h"
#import "CustomAnimationView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface CustomPullViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CustomAnimationView *animationView;
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@end

@implementation CustomPullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    animationView = [[CustomAnimationView alloc] initWithFrame:CGRectMake(0, -200, kScreenWidth, 200)];
    [_mTableView addSubview:animationView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Index%d",indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"offset is %@",NSStringFromCGPoint(_mTableView.contentOffset));
    CGFloat delta = 8./-150;
    if (_mTableView.contentOffset.y>-150) {
        [animationView setAnimationProgress:(_mTableView.contentOffset.y*delta)];
    }else
    {
        [animationView setAnimationProgress:8.];
    }
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
