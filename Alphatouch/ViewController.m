//
//  ViewController.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/10/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.fiftyPercentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.fiftyPercentButton.frame = CGRectMake(120, 200, 100, 44);
    [self.fiftyPercentButton setTitle:@"Make green!" forState:UIControlStateNormal];
    [self.fiftyPercentButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fiftyPercentButton];
    
    self.hundredPercentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.hundredPercentButton.frame = CGRectMake(120, 100, 100, 44);
    [self.hundredPercentButton setTitle:@"Make blue!" forState:UIControlStateNormal];
    [self.hundredPercentButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.hundredPercentButton];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadView
{
    CGRect viewRect = [[UIScreen mainScreen]bounds];
    UIView *view = [[UIView alloc]initWithFrame:viewRect];
    self.view = view;
    
}
-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.view.alpha =((double)arc4random() /0x100000000);
}
-(void) buttonPressed: (UIButton *)action
{
    

    
    if ([action isEqual:self.fiftyPercentButton]) {
        self.view.backgroundColor = [UIColor greenColor];

    }
    else  {
        self.view.backgroundColor = [UIColor blueColor];

    }
   
}
@end
