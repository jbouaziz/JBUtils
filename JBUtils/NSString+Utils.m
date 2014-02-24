//
//  NSString+Utils.m
//  JBUtils
//
//  Created by Jonathan BOUAZIZ on 18/02/2014.
//  Copyright (c) 2014 jbouaziz. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

+ (BOOL)isEmptyString:(NSString *)string {
    return !string || ![string isKindOfClass:[NSString class]] || [string isEmptyString];
}

+ (NSString *)formattedStringForDuration:(NSTimeInterval)duration {
    int minutes = floor(duration / 60);
    int seconds = round(duration - minutes * 60);
    return [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
}

- (NSString *)stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

- (BOOL)containsString:(NSString *)stringToLookFor {
    
    NSRange range = [self rangeOfString: stringToLookFor options:NSCaseInsensitiveSearch];
    BOOL found = ( range.location != NSNotFound );
    return found;
}

- (NSString *)capitalizeFirstLetter {
    if (self.length > 0) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[self substringToIndex:1] capitalizedString]];
    }
    
    return self;
}

- (NSString *)trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)removeDoubleSpaces {
    NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
    
    NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
    NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
    return [filteredArray componentsJoinedByString:@" "];
}

- (BOOL)isEmptyString {
    return self.length == 0 || [self trimmedString].length == 0;
}

- (UIColor *)colorFromHexString {
    if ([self isEmptyString]) return nil;
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner setScanLocation:[self hasPrefix:@"#"] ? 1 : 0]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (NSString *)validStringUrl {
    NSString *string = self.lowercaseString;
    if (![string hasPrefix:@"http://" options:NSCaseInsensitiveSearch] && ![string hasPrefix:@"https://" options:NSCaseInsensitiveSearch])
        string = [NSString stringWithFormat:@"http://%@", string];
    
    NSURL *url = [NSURL URLWithString:string];
    return url ? url.absoluteString : nil ;
    
    // Check if it's a valid url
    //
    /*NSString *theURL = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", theURL];
    return [urlTest evaluateWithObject:string] ? string : nil;*/
}

- (NSString *)replaceStringAtRange:(NSRange)range withString:(NSString *)string {
    NSString *start = [self substringToIndex:range.location];
    NSString *end = [self substringFromIndex:range.location + range.length];
    NSString *final = [NSString stringWithFormat:@"%@%@%@", start, string, end];
    return final;
}

- (NSString *)wordAtLocation:(int)index {
    NSRange range = [self wordRangeAtLocation:index];
    if (range.location == 0 && range.length == 0)
        return nil;
    else
        return [self substringWithRange:range];
}

/**
 *  http://stackoverflow.com/a/15391752/1835155
 */
- (NSRange)wordRangeAtLocation:(int)index {
    if (index > 0) --index;
    if (index < 0 || index >= self.length)
        [NSException raise:NSInvalidArgumentException format:@"Index out of range"];
    
    
    // This definition considers all punctuation as word characters
    //
    NSCharacterSet *wordCharacterSet = [[NSCharacterSet whitespaceAndNewlineCharacterSet] invertedSet];
    
    
    // 1. If [self characterAtIndex:index] is not a word character, return nil.
    //
    if (![wordCharacterSet characterIsMember:[self characterAtIndex:index]])
        return NSMakeRange(0, 0);
    
    
    // 2. Starting at adjustedIndex which is a word character, find the
    // beginning and end of the word
    //
    NSInteger beforeBeginning = index;
    while (beforeBeginning >= 0 && [wordCharacterSet characterIsMember:[self characterAtIndex:beforeBeginning]])
        --beforeBeginning;
    
    NSInteger afterEnd = index;
    while (afterEnd < self.length && [wordCharacterSet characterIsMember:[self characterAtIndex:afterEnd]])
        ++afterEnd;
    
    return NSMakeRange(beforeBeginning + 1, afterEnd - beforeBeginning - 1);
}

- (BOOL)hasPrefix:(NSString *) prefix options:(NSStringCompareOptions) options {
    
    // Avoid out of range exceptions.
    if (self.length < [prefix length]) {
        return NO;
    }
    
    // Check using options.
    NSComparisonResult result = [self compare:prefix options:options range:NSMakeRange(0, [prefix length])];
    return result == NSOrderedSame;
}

// https://gist.github.com/cihancimen/4146056
// http://trenskow.com/emoji-nscharacterset-objective-c-category/
- (BOOL)containsEmoji {
    
    __block BOOL returnValue = NO;
    NSString *string = self;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}


#pragma mark - Type detection

- (BOOL)isAddress {
    NSDataDetector *phoneLinkDetector = [[NSDataDetector alloc] initWithTypes:(NSTextCheckingTypeLink | NSTextCheckingTypeAddress) error:nil];
    return [phoneLinkDetector numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)] > 0;
}

- (BOOL)isPhoneNumber {
    NSDataDetector *phoneLinkDetector = [[NSDataDetector alloc] initWithTypes:NSTextCheckingTypePhoneNumber error:nil];
    return [phoneLinkDetector numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)] > 0;
}

@end
