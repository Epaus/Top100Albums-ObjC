//
//  TableViewDataSource.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/11/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "TableViewDataSource.h"
#import "Networking.h"

@interface TableViewDataSource()
@property (nonatomic, strong) Networking * networking;
@property (nonatomic, strong) NSArray * data;
@end

@implementation TableViewDataSource


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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mainViewCell"];
    }
    AlbumModel * model = self.data[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.artistName;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end


