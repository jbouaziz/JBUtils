//
//  NSString+Emojize.h
//  Field Recorder
//
//  Created by Jonathan Beilin on 11/5/12.
//  Copyright (c) 2012 DIY. All rights reserved.
//
//  Inspired by https://github.com/larsschwegmann/Emoticonizer
// https://github.com/diy/nsstringemojize

#import <Foundation/Foundation.h>

@interface NSString (Emojize)

- (NSString *)emojizedString;
- (NSString *)demojizedString;
+ (NSString *)emojizedStringWithString:(NSString *)text;
+ (NSString *)demojizedStringWithString:(NSString*)text;
+ (NSDictionary *)emojiAliases;

@end
