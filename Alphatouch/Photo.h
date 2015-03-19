//
//  Place.h
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/16/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject


@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSString *thumbnail;

-(id) initWithTitle:(NSString *)aTitle detail:(NSString *)aDetail filename:(NSString *)aFilename thmbnail:(NSString *)aThumbnail;


@end
