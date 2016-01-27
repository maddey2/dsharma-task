//
//  EconomyViewController.m
//  wall2
//
//  Created by Sathish Chinniah on 03/01/16.
//  Copyright © 2016 Sathish Chinniah. All rights reserved.
//

#import "EconomyViewController.h"
#import "TableView.h"

@interface EconomyViewController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>


@end

@implementation EconomyViewController
{
    
    NSMutableArray *cells_Array;
    NSArray *jsonObject;
    
    int selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cells_Array = [[NSMutableArray alloc] init];
    
    selectedIndex = -1;
    
    // Do any additional setup after loading the view, typically from a nib.
    //NSArray *jsonObject;
    jsonObject = @[
                   @{
                       @"partner": @"50",
                       @"gamer": @"199",
                       @"pointer": @"144"
                       
                       },
                   @{
                       @"partner": @"80",
                       @"gamer": @"112",
                       @"pointer": @"11"                   },
                   @{
                       @"partner": @"30",
                       @"gamer": @"112",
                       @"pointer": @"14"
                       
                       
                       },
                   @{
                       @"partner": @"50",
                       @"gamer": @"100",
                       @"pointer": @"199"
                       },
                   @{
                       @"partner": @"50",
                       @"gamer": @"19",
                       @"pointer": @"44"
                       
                       },
                   @{
                       @"partner": @"2000",
                       @"gamer": @"500",
                       @"pointer": @"1000"
                       }
                   ];
    
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:nil];
    
    
    
    NSString * jsonString=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
   // NSLog(@"%@",jsonString);
    
       // view configu
    
        CALayer *layer1 = self.TView.layer;
    
        layer1.shadowOffset = CGSizeMake(1, 1);
    
        layer1.shadowColor = [[UIColor colorWithRed:41/255.0 green:130/255.0 blue:75/255.0 alpha:1] CGColor]; //(41,130,75)
    
        layer1.shadowRadius = 1.0f;
    
        layer1.shadowOpacity = 1.0f;
    
       // layer1.shadowPath = [[UIBezierPath bezierPathWithRect:layer1.bounds] CGPath];
    

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    //    //get refrence of vertical indicator
    
    UIImageView *verticalIndicator = ((UIImageView *)[scrollView.subviews objectAtIndex:(scrollView.subviews.count-1)]);
    
    //set color to vertical indicator
    
    [verticalIndicator setBackgroundColor:[UIColor colorWithRed:41.0/255.0f green:130.0/255.0f blue:75.0/255.0f alpha:0.9]]; // Your color
    
    
    
    //get refrence of horizontal indicator
    
    //    UIImageView *horizontalIndicator = ((UIImageView *)[scrollView.subviews objectAtIndex:(scrollView.subviews.count-2)]);
    
    //    //set color to horizontal indicator
    
    //    [horizontalIndicator setBackgroundColor:[UIColor blueColor]]; // Your color
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // [cells_Array removeAllObjects];
    
    return [jsonObject count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableView";
    TableView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.lab1.text = [jsonObject objectAtIndex:indexPath.row][@"gamer"];
    cell.lab2.text = [jsonObject objectAtIndex:indexPath.row][@"partner"];
    cell.lab3.text = [jsonObject objectAtIndex:indexPath.row][@"pointer"];
    
    if(indexPath.row == selectedIndex)
    {
        [cell.checkBtn setSelected:true];
    }
    
    [cells_Array addObject:cell];
    
    return cell;
    NSLog(@"Select Cell Row: %d", indexPath.row);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    for (TableView *view in cells_Array ) {
        [view.checkBtn setSelected:false];
    }
    TableView *cellView = [self.containerTableView cellForRowAtIndexPath:indexPath];
    
    selectedIndex = (int)indexPath.row;
    
    [cellView.checkBtn setSelected:true];
}


@end
