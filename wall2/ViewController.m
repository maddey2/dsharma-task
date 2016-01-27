//
//  ViewController.m
//  wall2
//
//  Created by James on 28/12/15.
//  Copyright © 2015 James. All rights reserved.
//
#import "ViewController.h"
#import "UUChart.h"
#import "UUBarChart.h"


@interface ViewController ()<UUChartDataSource>
{
    
    NSDate *firstdate;
    UUChart *chart;
    int path;
    
    int arrNum;
    
    int asd;
    
    NSArray *arrJanuary1,*arrJanuary2,*arrDecember1,*arrDecember2,*arrNovember1,*arrNovember2;
}


@end


@implementation ViewController
@synthesize flabel;
@synthesize slabel;
@synthesize tlabel;
@synthesize folabel;
@synthesize fivlabel;
@synthesize sixlabel;
@synthesize sevenlabel;
@synthesize dateLabel;
//@synthesize walletView;
@synthesize leftBtn;
@synthesize rightBtn;
@synthesize Customscrollview;
@synthesize tableView;



- (void)viewDidLoad {
    [super viewDidLoad];

    arrNum = 0;
    
    firstdate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:-6 toDate:[NSDate date] options:nil];
    //
    

        [self monthArray];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM,yyyy"];
    dateLabel.text = [dateFormat stringFromDate:[NSDate date]];
    dateLabel.text = [dateFormat stringFromDate: firstdate];
    
    
   
        [self dateChange];
        
        chart = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(5,self.view.frame.size.height- 270,[UIScreen mainScreen].bounds.size.width+40, 265) withSource:self
        withStyle:UUChartBarStyle];
        
        chart.layer.borderColor = [UIColor grayColor].CGColor;
        chart.layer.borderWidth = 1.0f;
        [chart showInView:self.view];
    

       //[self dateChange];


}
-(void)dateChange
{
    NSArray *labelArray = @[flabel, slabel, tlabel, folabel, fivlabel,sixlabel,sevenlabel];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    dateFormatter.dateFormat = @"ddMMM";
    for (NSInteger i = 0; i < 7; ++i) {
        NSDate *nextDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:i toDate:firstdate options:nil];
        UILabel *label = (UILabel *)labelArray[i];
        label.text = [dateFormatter stringFromDate:nextDate];
        if (i==6) {
            dateFormatter.dateFormat=@"MMM,yyyy";
            dateLabel.text = [[dateFormatter stringFromDate:nextDate] capitalizedString];
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            
            if ([[dateFormat stringFromDate:nextDate] isEqualToString:[dateFormat stringFromDate:[NSDate date]]])
            {
                rightBtn.enabled = false;
                
                //It's the same day
                
            }
            else
            {
                rightBtn.enabled = true;
            }
        }
    }
}
- (IBAction)calRight:(id)sender {
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    firstdate = [calendar dateByAddingUnit:NSCalendarUnitDay value:7 toDate:firstdate options:nil];
    [self dateChange];
    //////
    
    NSDate *thisDate = [NSDate date];
    
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitYear fromDate:thisDate];
    
    
    
    chart = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(5,self.view.frame.size.height- 270,[UIScreen mainScreen].bounds.size.width+40, 265) withSource:self withStyle:UUChartBarStyle];
    
    chart.layer.borderColor = [UIColor grayColor].CGColor;
    chart.layer.borderWidth = 1.0f;
    [chart showInView:self.view];
    
    
}

- (IBAction)calLeft:(id)sender {
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    firstdate = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:firstdate options:nil];
    
    [self dateChange];
    
    
    
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:firstdate];
 
    
    
    chart = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(5,self.view.frame.size.height- 270,[UIScreen mainScreen].bounds.size.width+40, 265) withSource:self withStyle:UUChartBarStyle];
    
    chart.layer.borderColor = [UIColor grayColor].CGColor;
    chart.layer.borderWidth = 1.0f;
    [chart showInView:self.view];
    
}





- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    
    return @[@"Jan11",@"Jan12",@"Jan13",@"Jan14",@"Jan15",@"Jan16",@"Jan17",@"Jan18",@"Jan19",@"Jan20",@"Jan21",@"Jan22",@"Jan23",@"Jan24",@"Jan25",@"Jan26",@"jan27"];
}

- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
//    NSArray *ary1 = @[@"2",@"4",@"6",@"8",@"10",@"12",@"14",@"16",@"14",@"12",@"10",@"8",@"6",@"4",@"2",@"2",@"14"];
//    NSArray *ary2 = @[@"4",@"8",@"16",@"20",@"24",@"28",@"32",@"36",@"32",@"28",@"24",@"20",@"16",@"12",@"8",@"4"];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *newDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:firstdate options:nil];
    
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:newDate];
    if(![self isDataAvailableAtDate:dateComp])
    {
        _lblUsage.hidden = NO;
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        [window addSubview:_lblUsage];
        
        
        return @[];
    }
   
    _lblUsage.hidden = YES;
    if(dateComp.month == 1)
    {
        return @[arrJanuary1,arrJanuary2];
    }
    else if(dateComp.month == 12)
    {
        return @[arrDecember1,arrDecember2];
    }
    else
    {
        return @[arrNovember1,arrNovember2];
    }
    return @[[self generateArray],[self generateArray]];
}

-(void)monthArray
{
    arrJanuary1 = @[@"15",@"3",@"5",@"15",@"7",@"4",@"9",@"15",@"2",@"15",@"15",@"11",@"8",@"8",@"3",@"7",@"5",@"5",@"3",@"4",@"6",@"12",@"10",@"7",@"6",@"12",@"5"];
    
    
        arrJanuary2 = @[@"12",@"4",@"6",@"4",@"7",@"9",@"11",@"12",@"15",@"12",@"13",@"5",@"6",@"9",@"11",@"3",@"4",@"5",@"10",@"12",@"6",@"5",@"8",@"9",@"4",@"6",@"8"];
    
    
        arrDecember1 = @[@"12",@"4",@"6",@"4",@"7",@"9",@"11",@"12",@"15",@"12",@"13",@"5",@"6",@"9",@"11",@"3",@"4",@"5",@"10",@"12",@"6",@"5",@"8",@"9",@"4",@"6",@"8"];
    
        arrDecember2 = @[@"15",@"3",@"5",@"15",@"7",@"4",@"9",@"15",@"2",@"15",@"15",@"11",@"8",@"8",@"3",@"7",@"5",@"5",@"3",@"4",@"6",@"12",@"10",@"7",@"6",@"12",@"5"];
    
    
    
        arrNovember1 = @[@"15",@"3",@"5",@"15",@"7",@"4",@"9",@"15",@"2",@"15",@"15",@"11",@"8",@"8",@"3",@"7",@"5",@"5",@"3",@"4",@"6",@"12",@"10",@"7",@"6",@"12",@"5"];
        arrNovember2 = @[@"15",@"15",@"15",@"13",@"15",@"4",@"15",@"15",@"5",@"15",@"15",@"15",@"15",@"15",@"8",@"15",@"11",@"15",@"15",@"4",@"15",@"15",@"15",@"15",@"7",@"15",@"15"];
}

-(NSArray *)generateArray
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *newDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:firstdate options:nil];
    
    NSDateComponents *dateComp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:newDate];

    if(dateComp.month == 1)
    {
        return arrJanuary1;
    }
    else if (dateComp.month == 12)
    {
        return arrDecember1;
    }
    else
    {
        return arrNovember1;
    }
    

    return nil;
}

-(BOOL)isDataAvailableAtDate:(NSDateComponents *)date
{
    if(date.day > 1 && date.day < 10)
    {
        return NO;
    }
    if(date.month<11 && date.year<2016)
    {
        return NO;
    }
    
    return YES;
}

#pragma mark - @optional
//颜色数组
- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUBlue, UUGreen];
}
//显示数值范围
//- (CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart
//{
//    
//    if (path==0) {
//        return CGRangeMake(60, 10);
//    }
//    if (path==2) {
//        return CGRangeMake(100, 0);
//    }
//    return CGRangeZero;
//}

#pragma mark 折线图专享功能

////标记数值区域
//- (CGRange)UUChartMarkRangeInLineChart:(UUChart *)chart
//{
//  
//    if (path==2) {
//        return CGRangeMake(25, 75);
//    }
//    return CGRangeZero;}
//
////判断显示横线条
//- (BOOL)UUChart:(UUChart *)chart ShowHorizonLineAtIndex:(NSInteger)index
//{
//    return YES;
//}
//
////判断显示最大最小值
//- (BOOL)UUChart:(UUChart *)chart ShowMaxMinAtIndex:(NSInteger)index
//{
//    return 2;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
