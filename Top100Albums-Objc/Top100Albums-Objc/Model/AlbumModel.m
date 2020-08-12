//
//  AlbumModel.m
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import "AlbumModel.h"

@interface AlbumModel()

@end

@implementation AlbumModel

-(instancetype)initWwithArtistName:(NSString *)artistName albumId:(NSString *)albumId  releaseDate:(NSDate *)releaseDate name:(NSString *)name url:(NSString *)url genres:(NSArray *)genres  copyright:(NSString *)copyright artworkUrl100:(NSString *)artworkUrl100 {
    
    self = [super init];
    if (self) {
        _artistName = artistName;
        _albumId = albumId;
        _releaseDate = releaseDate;
        _name = name;
        _url = url;
        _genres = genres;
        _copyright = copyright;
        _artworkUrl100 = artworkUrl100;
    }
    return self;
}

@end




