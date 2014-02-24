//
//  NSString+Utils.h
//  JBUtils
//
//  Created by Jonathan BOUAZIZ on 18/02/2014.
//  Copyright (c) 2014 jbouaziz. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Return a color from an hexadecimal value. e.g.: #00FF00
 *
 *  @param v Accepted formats are #RRGGBB or RRGGBB. Not case sensitive.
 *
 *  @return UIColor value
 */
#define kColorFromHex(v)                [v colorFromHexString]


/**
 *  Utility methods for strings.
 */
@interface NSString (Utils)


/**
*  Returns YES if the value is nil or is a zero length string after removing all whitespace.
*
*  @param string The string value to be tested.
*
*  @return YES if the value is nil, empty or contains only whitespace characters.
*/
+ (BOOL)isEmptyString:(NSString *)string;


/**
 *  Returns a formatted string for a given duration. e.g.: 64 become 1:04
 *
 *  @param duration duration value
 *
 *  @return Formatted duration
 */
+ (NSString *)formattedStringForDuration:(NSTimeInterval)duration;


/**
 *  Strip a string from his html tags.
 *
 *  @return Stripped string
 */
- (NSString *)stringByStrippingHTML;


/**
 Returns a string after removing the whitespaces and new lines characters.
 
 @return Trimmed string.
 */
- (NSString *)trimmedString;


/**
 *  Case insensitive search inside a string.
 *
 *  @param stringToLookFor String to use
 *
 *  @return YES if there is a match.
 *  @see [NSString compare:options:range:]
 */
- (BOOL)containsString:(NSString*)stringToLookFor;


/**
 *  Capitalize the first letter of a sentence.
 *
 *  @return Capitalized string value
 */
- (NSString *)capitalizeFirstLetter;


/**
 *  Return a color from an hexadecimal value. e.g.: #00FF00
 *  Accepted formats are #RRGGBB or RRGGBB. Not case sensitive.
 *
 *  @return UIColor value
 */
- (UIColor *)colorFromHexString;


/**
 *  Check if a string url starts with http:// or https:// if it isn't it will add it. The search is case insensitive.
 *
 *  @return Valid string url
 */
- (NSString *)validStringUrl;


/**
 *  @"    Hello      this  is a   long       string!   "; becomes @"Hello this is a long string!"
 *
 *  @return Cleaned string
 */
- (NSString *)removeDoubleSpaces;


/**
 *  Replaces one string by another at a given range.
 *
 *  @param range  NSRange to look for
 *  @param string New string value
 *
 *  @return Replaced string
 */
- (NSString *)replaceStringAtRange:(NSRange)range withString:(NSString *)string;


/**
 *  Retrieve the word range at a given location.
 *
 *  @param location Where to look for
 *
 *  @return Word range in the current string or nil if nothing was found.
 */
- (NSRange)wordRangeAtLocation:(int)location;


/**
 *  Retrieve the word at a given location.
 *
 *  @param location Location to look at
 *
 *  @return Word or nil if nothing was found.
 */
- (NSString *)wordAtLocation:(int)location;


/**
 *  A more complex prefix check which applies the passed options. Typically these specify such things as case sensitivity.
 *
 *  @param prefix  the string to test for a prefix match.
 *  @param options the options to use in the match. See [NSString compare:options:range:] for details on the options.
 *
 *  @see [NSString compare:options:range:]
 *  @return YES if there is a match.
 */
- (BOOL)hasPrefix:(NSString *)prefix options:(NSStringCompareOptions)options;


/**
 *  Check if the current string contains an emoji.
 *
 *  @return YES if there is a match.
 */
- (BOOL)containsEmoji;


/**
 *  Check if the current string is an address using NSTextCheckingTypePhoneNumber
 *
 *  @return YES if there is a match.
 */
- (BOOL)isAddress;


/**
 *  Check if the current string is an address using NSTextCheckingTypeAddress
 *
 *  @return YES if there is a match.
 */
- (BOOL)isPhoneNumber;


@end
