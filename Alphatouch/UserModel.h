//
//  UserModel.h
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/16/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"
@interface UserModel : NSObject <NSCoding>

@property (strong,nonatomic) NSString *firstName, *lastName, *city, *biography, *memberSince, *location;
@property (strong, nonatomic) Photo *profilePhoto;
@property (strong,nonatomic) NSArray *favoritePhotos;


-(id) initWithJSON;
+(NSString*) getPathToArchive;
+(void) saveUser:(id) aUser;
+(UserModel*) getUser;

@end
