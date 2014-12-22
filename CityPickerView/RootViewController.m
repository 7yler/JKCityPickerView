//
//  RootViewController.m
//  CityPickerView
//
//  Created by Jakey on 14/12/22.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"
#import "JKCityPickerView.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    JKCityPickerView *picker = [[JKCityPickerView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-260, screenFrame.size.width, 260)];
  
    
    
    self.text.inputView = picker;
    
    NSArray *dataList = [[self loadJSON:@"cityDataList"] objectForKey:@"dataList"];
    [picker setDataList:dataList];
    [picker setOnChangeBlock:^(NSString *province, NSString *city,NSDictionary *cityItem) {
        self.text.text = [province stringByAppendingString:city];
    }];
    [picker setRightActionBlock:^(NSString *province, NSString *city,NSDictionary *cityItem) {
        NSLog(@"cityItem:%@",[cityItem description]);
        

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDictionary*)loadJSON:(NSString*)jsonName{
    NSError *errorString;
    NSError *errorJson;

    NSString *JsonPath = [[NSBundle mainBundle] pathForResource:jsonName ofType:@"json"];
    NSString *jsonString=[NSString stringWithContentsOfFile:JsonPath encoding:NSUTF8StringEncoding error:&errorString];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    return jsonDict;
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
