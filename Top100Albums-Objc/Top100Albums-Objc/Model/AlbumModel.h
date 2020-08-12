//
//  AlbumModel.h
//  Top100Albums-Objc
//
//  Created by Estelle Paus on 8/10/20.
//  Copyright © 2020 Paus Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumModel: NSObject

@property (strong) NSString * artistName;
@property (strong) NSString * albumId;
@property (strong) NSDate * releaseDate;
@property (strong) NSString * name;
@property (strong) NSString * url;
@property (strong) NSArray * genres;
@property (strong) NSString * copyright;
@property (strong) NSString * artworkUrl100;

-(instancetype)initWwithArtistName:(NSString *)artistName albumId:(NSString *)albumId  releaseDate:(NSDate *)releaseDate name:(NSString *)name url:(NSString *)url genres:(NSArray *)genres  copyright:(NSString *)copyright artworkUrl100:(NSString *)artworkUrl100;
 
@end
