//
//  BSJEssenceViewController.m
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/5/11.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "BSJEssenceViewController.h"
#import "ZJScrollPageView.h"
#import "LMJTopicViewController.h"

@interface BSJEssenceViewController ()<ZJScrollPageViewDelegate>
@property (nonatomic, weak) ZJScrollPageView *scrollPageView;
@end

@implementation BSJEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    1为全部，10为图片，29为段子，31为音频，41为视频
    
    LMJTopicViewController *words = [[LMJTopicViewController alloc] initWithTitle:@"段子"];
    LMJTopicViewController *voice = [[LMJTopicViewController alloc] initWithTitle:@"音频"];
    LMJTopicViewController *picture = [[LMJTopicViewController alloc] initWithTitle:@"图片"];
    LMJTopicViewController *video = [[LMJTopicViewController alloc] initWithTitle:@"视频"];
    
    LMJTopicViewController *all = [[LMJTopicViewController alloc] initWithTitle:@"全部"];
    
    words.topicType = LMJTopicViewControllerTypeWords;
    voice.topicType = LMJTopicViewControllerTypeVoice;
    picture.topicType = LMJTopicViewControllerTypePicture;
    video.topicType = LMJTopicViewControllerTypeVideo;
    all.topicType = LMJTopicViewControllerTypeAll;
    
    [self addChildViewController:words];
    [self addChildViewController:voice];
    [self addChildViewController:picture];
    [self addChildViewController:video];
    [self addChildViewController:all];
    
    self.scrollPageView.backgroundColor = [UIColor groupTableViewBackgroundColor];

}


#pragma mark - getter

- (ZJScrollPageView *)scrollPageView
{
    if(_scrollPageView == nil)
    {
        ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
        //显示滚动条
        style.showLine = YES;
        // 颜色渐变
        style.gradualChangeTitleColor = YES;
        
        style.animatedContentViewWhenTitleClicked = NO;
        
        style.autoAdjustTitlesWidth = YES;
        
        ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64, self.view.lmj_width, self.view.lmj_height - 64) segmentStyle:style titles:[self.childViewControllers valueForKey:@"title"] parentViewController:self delegate:self];
        
        [self.view addSubview:scrollPageView];
        _scrollPageView = scrollPageView;
        
        scrollPageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        
    }
    return _scrollPageView;
}


#pragma mark - ZJScrollPageViewDelegate
- (NSInteger)numberOfChildViewControllers {
    
    return self.childViewControllers.count;
    
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
        
        childVc = self.childViewControllers[index];
        
    }
    
    return childVc;
}


- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}


#pragma mark - LMJNavUIBaseViewControllerDataSource


- (UIStatusBarStyle)navUIBaseViewControllerPreferStatusBarStyle:(LMJNavUIBaseViewController *)navUIBaseViewController
{
    return UIStatusBarStyleLightContent;
}

/** 背景色 */
- (UIColor *)lmjNavigationBackgroundColor:(LMJNavigationBar *)navigationBar
{
    return RGB(208, 50, 40);
}

/** 是否隐藏底部黑线 */
- (BOOL)lmjNavigationIsHideBottomLine:(LMJNavigationBar *)navigationBar
{
    return YES;
}

/** 导航条中间的 View */
- (UIView *)lmjNavigationBarTitleView:(LMJNavigationBar *)navigationBar
{
    return ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
        imageView.backgroundColor = [UIColor whiteColor];
        
        
        imageView;
    });
}
/** 导航条左边的按钮 */
- (UIImage *)lmjNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LMJNavigationBar *)navigationBar
{
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    return [UIImage imageNamed:@"MainTagSubIcon"];
}
/** 导航条右边的按钮 */
- (UIImage *)lmjNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(LMJNavigationBar *)navigationBar
{
    [rightButton setImage:[UIImage imageNamed:@"nav_coin_icon_click"] forState:UIControlStateHighlighted];
    return [UIImage imageNamed:@"nav_coin_icon"];
}



#pragma mark - LMJNavUIBaseViewControllerDelegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    
}







@end
