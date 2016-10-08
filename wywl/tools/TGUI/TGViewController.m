//
//  TGViewController.m
//  SH12321
//
//  Created by Tommy on 6/8/16.
//  Copyright © 2016 12321. All rights reserved.
//

#import "TGViewController.h"

static CGFloat const navigationViewWidth = 180.0F;            //导航栏view最大宽度
static CGFloat const navigationViewHeight = 24.0F;            //导航栏view最大高度


@interface TGViewController ()

@end

@implementation TGViewController
{
    TGView *tabBarLinaView;
    
    // 无网提示View
    TGView *noNetworkBGView;
    TGView *noNetworkWhiteView;
    TGLabel *noNetworkLabel;
    TGButton *noNetworkButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar addSubview:tabBarLinaView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    if(![MMCommonManager connectedToNetwork]) {
//        [self performSelector:@selector(showAlertView) withObject:nil afterDelay:0.5f];
//    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [tabBarLinaView removeFromSuperview];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    [self.tabBarItem setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor colorWithRed:255.0/255.0f green:99/255.0f blue:99/255.0f alpha:1]} forState:UIControlStateSelected];
    
    
    // 显示NavigationBar底部黑色线
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=NO;
                        imageView2.alpha = 0.23f;
                    }
                }
            }
        }
    }
    
    if (!tabBarLinaView) {
        tabBarLinaView = [TGView initWithFrame:CGRectMake(0, -1, DEVICE_W, 1) superView:nil];
        tabBarLinaView.backgroundColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1];
    }
    
    //导航栏标题
    CGRect navigationLabelRect;
    if (!EMPTY_STRING(self.navigationTitle)) {
        navigationLabelRect = [TGManager rectWithString:self.navigationTitle attrDic:@{NSFontAttributeName: FONTSIZE20}];;
    }else{
        navigationLabelRect = CGRectZero;
    }
    _navigationView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, navigationViewWidth, navigationViewHeight)];
    _navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake((navigationViewWidth - navigationLabelRect.size.width)/2, 0, navigationLabelRect.size.width, navigationViewHeight)];
    _navigationLabel.textAlignment = NSTextAlignmentCenter;
    _navigationLabel.textColor = C_WHITE;
    _navigationLabel.font = FONTSIZE20;
    _navigationLabel.text = self.navigationTitle;
    [_navigationView addSubview:_navigationLabel];
    self.navigationItem.titleView = _navigationView;
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(0, 0, 48.0F, 48.0F);
    
    [_leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40.0F, 0, 0);
    
    [_leftBtn setTitle:@"" forState:UIControlStateNormal];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(0, 0, 48, 48);
    [_rightBtn setTitleColor:C_BLACK forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = FONTSIZE16;
    [_rightBtn addTarget:self action:@selector(rightBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    //    rightItem.width = 20;//此处修改到边界的距离，请自行测试
    self.navigationItem.rightBarButtonItem = rightItem;
    _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -32);
    if (self.view.frame.size.height > 667) {
        _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -40);
        _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -46.0F, 0, 0);
    }
    
}
- (void)noNetworkButtonAction {
    
    if(![TGManager connectedToNetwork]) {
        [self dismissNoNewWorkView];
        [self performSelector:@selector(showAlertView) withObject:nil afterDelay:0.5f];
    }else {
        [self dismissNoNewWorkView];
    }
}

- (void)dismissNoNewWorkView {
    [noNetworkLabel removeFromSuperview];
    [noNetworkButton removeFromSuperview];
    [noNetworkWhiteView removeFromSuperview];
    [noNetworkBGView removeFromSuperview];
}

- (void)showAlertView {
    noNetworkBGView = [TGView initWithFrame:CGRectMake(0, 0, DEVICE_W, DEVICE_H) backgroundColor:[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.5] superView:[UIApplication sharedApplication].keyWindow];
    
    noNetworkWhiteView = [TGView initWithFrame:CGRectMake(0, 0, 250, 150) backgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1] superView:noNetworkBGView];
    noNetworkWhiteView.center = noNetworkBGView.center;
    noNetworkWhiteView.layer.masksToBounds = YES;
    noNetworkWhiteView.layer.cornerRadius = 6;
    
    noNetworkLabel = [TGLabel initWithFrame:CGRectMake(0, 0, noNetworkWhiteView.width, noNetworkWhiteView.height - 50) text:@"网络连接失败\n请查看网络是否连接正常！" textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:15.0f] textAlignment:NSTextAlignmentCenter superView:noNetworkWhiteView];
    noNetworkLabel.numberOfLines = 0;
    NSMutableAttributedString *titleAttributedString = [[NSMutableAttributedString alloc]initWithString:noNetworkLabel.text];
    NSMutableParagraphStyle *titleParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    [titleParagraphStyle setLineSpacing:6];
    [titleAttributedString addAttribute:NSParagraphStyleAttributeName value:titleParagraphStyle range:NSMakeRange(0, noNetworkLabel.text.length)];
    noNetworkLabel.attributedText = titleAttributedString;
    noNetworkLabel.textAlignment = NSTextAlignmentCenter;
    
    noNetworkButton = [TGButton initTitleBtnWithFrame:CGRectMake(0, noNetworkLabel.height + noNetworkLabel.y, noNetworkLabel.width, 60) title:@"重试一下" titleColor:C_BLACK titleFont:[UIFont systemFontOfSize:14.0f] backgroundColor:[UIColor whiteColor] superView:noNetworkWhiteView];
    [noNetworkButton addTarget:self action:@selector(noNetworkButtonAction) forControlEvents:UIControlEventTouchUpInside];
    noNetworkButton.layer.borderColor = C_BLUE.CGColor;
    noNetworkButton.layer.borderWidth = 0.5f;
    [noNetworkButton setTitleColor:C_BLUE forState:UIControlStateHighlighted];
}

#pragma mark -- 返回按钮
- (void)leftBtnDidClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 右边点击按钮
- (void)rightBtnDidClick{
    
}

#pragma mark -- 右边点击按钮
- (void)rightTitleBtnDidClick{
    
}

- (void)hiddenTabbar{
    [UIView animateWithDuration:0.2 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, DEVICE_H + 1, DEVICE_W, 49);
        for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
            if (view.tag == 1010101) {
                view.frame = CGRectMake(view.frame.origin.x, DEVICE_H + 1, view.frame.size.width, view.frame.size.height);
            }
        }
    } completion:^(BOOL finished) {
//        [MMShare sharedInstance].isShowTabbar = NO;
    }];
}

- (void)showTabbar{
    [UIView animateWithDuration:0.2 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, DEVICE_H - 49, DEVICE_W, 49);
        for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
            if (view.tag == 1010101) {
                view.frame = CGRectMake(view.frame.origin.x, DEVICE_H - 45, view.frame.size.width, view.frame.size.height);
            }
        }
    } completion:^(BOOL finished) {
//        [MMShare sharedInstance].isShowTabbar = YES;
    }];
}

- (void)setRightTitleStyle {
    
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
