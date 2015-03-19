//
//  ProfileEditViewController.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/17/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "ProfileEditViewController.h"

@interface ProfileEditViewController ()

@end

@implementation ProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationField = [[UITextField alloc]init];
    self.locationField.frame = CGRectMake(20, 480, 280, 40);
    self.locationField.borderStyle = UITextBorderStyleRoundedRect;
    self.locationField.keyboardType = UIKeyboardTypeDefault;
    self.locationField.text = self.user.location;
    self.locationField.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.locationField];
    
    UIButton *savebutton = [[UIButton alloc]initWithFrame:CGRectMake(15, 100, 280, 50)];
    [savebutton setTitle:@"Save Location" forState:UIControlStateNormal];
    savebutton.backgroundColor = [UIColor blackColor];
    [savebutton addTarget:self action:@selector(saveLocation) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:savebutton];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enetringFore) name:UIApplicationWillEnterForegroundNotification object:nil];
    

    
    
}
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Location Edit";
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveUserWhenClosing) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enetringFore) name:UIApplicationWillEnterForegroundNotification object:nil];
        
    }
    return self;
}

-(void) saveUserWhenClosing
{
    [UserModel saveUser:self.user];
}

-(void) enetringFore
{
    self.user = [UserModel getUser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    self.user.location = textField.text;
    
    [textField resignFirstResponder];

    return YES;
}
-(void) saveLocation
{
    self.user.location = self.locationField.text;
    [UserModel saveUser:self.user];
    
    [self dismissViewControllerAnimated:YES completion:nil ];
    
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
