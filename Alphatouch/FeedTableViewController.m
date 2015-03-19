//
//  FeedTableViewController.m
//  Alphatouch
//
//  Created by Yazeed Abalkhail on 3/11/15.
//  Copyright (c) 2015 Yazeed Abalkhail. All rights reserved.
//

#import "FeedTableViewController.h"
#import "PhotoViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import "Photo.h"
@interface FeedTableViewController ()

@end

@implementation FeedTableViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Feed";
        self.tabBarItem.image = [UIImage imageNamed:@"lyre_filled-32"];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // JSON operation into get images into Array
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://operation-models.codeschool.com/feedImages.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    AFHTTPRequestOperation *information = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    information.responseSerializer = [AFJSONResponseSerializer serializer];
    [information setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *temp = [[NSMutableArray alloc]init];
        
        for(NSDictionary *images in responseObject){
            Photo *carl = [[Photo alloc]initWithTitle:images[@"title"]
                                               detail:images[@"detail"]
                                             filename:images[@"filename"]
                                             thmbnail:images[@"thumbnail"]];
            [temp addObject:carl];
        
            
        }
        self.photos = [[ NSArray alloc]initWithArray:temp];
        
        
            
        [self.tableView reloadData];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"NSError: %@",error.localizedDescription);
    }];
    [information start];

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view data source

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PhotoViewController *photoVC = [[PhotoViewController alloc]init];
    photoVC.photo.filename = [self.photos[indexPath.row]filename];
  
    
    [self.navigationController pushViewController:photoVC animated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Title"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Title"];
    }
    
    // We use KEYS of the photos modual to gather infor of JSON
    
        cell.textLabel.text = [self.photos[indexPath.row]title];
    cell.detailTextLabel.text = [self.photos[indexPath.row]detail];

    
        
        
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
