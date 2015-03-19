//
//  Place.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/16/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "Photo.h"

@implementation Photo


-(id) init
{
   
    self = [self initWithTitle:@"title" detail:@"detail" filename:@"placeholder" thmbnail:@"placeholder"];
    return self;
}

-(id) initWithTitle:(NSString *)aTitle detail:(NSString *)aDetail filename:(NSString *)aFilename thmbnail:(NSString *)aThumbnail
{
    self = [super init];
    if (self) {
        self.title = aTitle;
        self.detail = aDetail;
        self.filename = aFilename;
        self.thumbnail = aThumbnail;
    }
    return self;
}


@end
