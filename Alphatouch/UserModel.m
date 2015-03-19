//
//  UserModel.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/16/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "UserModel.h"
#import "AFHTTPRequestOperation.h"
#import "Photo.h"
@implementation UserModel

-(id) initWithJSON
{
    self = [super init];
    if (self) {
        NSURL *url = [[NSURL alloc] initWithString:@"http://operation-models.codeschool.com/userProfile.json"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
         {
            self.firstName = responseObject[@"firstName"];
            self.lastName = responseObject [@"lastName"];
            self.city = responseObject[@"city"];
            self.profilePhoto = [[Photo alloc]initWithTitle:@"Profile Photo"
                                                     detail:@"detail"
                                                    filename:responseObject[@"profilePhoto"]
                                                    thmbnail: responseObject[@"profilePhotoThumbnail"]];
             
            self.biography = responseObject[@"biography"];
            self.memberSince = responseObject[@"memberSince"];
            self.location = @"no location yet";
 self.favoritePhotos = nil;
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFinishedLoading" object:nil];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"NSError: %@",error.localizedDescription);
            
        }];
        
        [operation start];


    }

    return self;

}

-(id) init
{
self = [self initWithJSON];
return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    if (self) {

    self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
    self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
    self.city = [aDecoder decodeObjectForKey:@"city"];
    self.biography = [aDecoder decodeObjectForKey:@"biography"];
//        self.profilePhoto = [aDecoder decodeObjectForKey:@"profilePhoto"];

    self.memberSince = [aDecoder decodeObjectForKey:@"memberSince"];
    self.location = [aDecoder decodeObjectForKey:@"location"];
    self.favoritePhotos = [aDecoder decodeObjectForKey:@"favorite"];
    }
    
    return self;
    
    
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.memberSince forKey:@"memberSince"];
//    [aCoder encodeObject:self.profilePhoto forKey:@"profilePhoto"];

    [aCoder encodeObject:self.location forKey:@"location"];
    [aCoder encodeObject:self.biography forKey:@"biography"];
    [aCoder encodeObject:self.favoritePhotos forKey:@"favorite"];

    
}

+(NSString*) getPathToArchive
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [path objectAtIndex:0];
    
    return [docsDir stringByAppendingString:@"user.model"];
    
    
}
+(UserModel*) getUser
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[UserModel getPathToArchive]];
}

+(void) saveUser:(id) aUser
{
    [NSKeyedArchiver archiveRootObject:aUser toFile:[UserModel getPathToArchive]];
    
}



    @end
