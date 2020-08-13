//
//  TableViewDataSource.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/11/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "TableViewDataSource.h"
#import "Networking.h"
#import "MainTableViewCell.h"
#import "UIImageView+UIImageView_GetImage.h"

@interface TableViewDataSource()
@property (nonatomic, strong) Networking * networking;
@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) NSMutableArray * imageArray;
@end

@implementation TableViewDataSource
@synthesize imageArray = _imageArray;

- (NSMutableArray*)imageArray
{
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return _imageArray;
}


-(instancetype)initWithNetworking:(Networking *)nw {
    self = [super init];
    if (self) {
        _networking = nw;
    }
    return self;
}

-(void)refreshData:(void (^)(void))completion {
    __weak TableViewDataSource *wself = self;
      [_networking makeRequest: ^(NSArray* models){
          wself.data = models;
           completion();
      }];
   
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainViewCell"];
    if (cell == nil) {
        cell = (MainTableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mainViewCell"];
    }
    AlbumModel * model = self.data[indexPath.row];
    cell.albumTitle.text = model.name;
    cell.artistName.text = model.artistName;
    if ([self.imageArray count] > 0 && self.imageArray[indexPath.row] != nil) {
        cell.thumbnailImageview.image = self.imageArray[indexPath.row];
    } else {
        UIImageView *tempView = [[UIImageView alloc] init];
        [tempView getImageWithUrl:model.artworkUrl100];
        self.imageArray[indexPath.row] = tempView.image;
        cell.thumbnailImageview.image = tempView.image;
    }
    
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end


