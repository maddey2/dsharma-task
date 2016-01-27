//
//  ViewController.h
//  wall2
//
//  Created by James on 28/12/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(weak,nonatomic) IBOutlet UILabel *lblUsage;

@property (weak, nonatomic) IBOutlet UILabel *flabel;
@property (weak, nonatomic) IBOutlet UILabel *slabel;

@property (weak, nonatomic) IBOutlet UILabel *tlabel;

@property (weak, nonatomic) IBOutlet UILabel *folabel;

@property (weak, nonatomic) IBOutlet UILabel *fivlabel;
@property (weak, nonatomic) IBOutlet UILabel *sixlabel;
@property (weak, nonatomic) IBOutlet UILabel *sevenlabel;


//@property (weak, nonatomic) IBOutlet UIView *walletView;//1

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;//2
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property(weak,nonatomic) IBOutlet UIView *chartview;
@property(nonatomic,strong)  UIScrollView *Customscrollview;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

