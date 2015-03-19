//
//  FavoritesTableViewController.h
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/19/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserModel;
@interface FavoritesTableViewController : UITableViewController

@property (strong,nonatomic) UserModel *user;
@end
