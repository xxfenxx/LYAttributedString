//
//  NSString+CHAttributedString.m
//
//  Created by yons on 16/8/25.
//  Copyright © 2016年 iOS Coding. All rights reserved.
//

#import "NSString+LYAttributedString.h"

@implementation NSString (LYAttributedString)

- (NSArray *)ranges:(NSString *)subString {
    NSMutableArray *ranges = [NSMutableArray new];
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:subString options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange range = NSMakeRange(0, self.length);
    NSArray *matches = [regex matchesInString:self options:NSMatchingReportCompletion range:range];
    for (NSTextCheckingResult *result in matches) {
       [ranges addObject:[NSValue valueWithRange:result.range]];
    }
    return ranges;
}

// 字体大小
- (NSMutableAttributedString *)attributeFontSize:(CGFloat)fontSize textRange:(NSRange)textRange {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:textRange];
    return mString;
}

// 字体大小
- (NSMutableAttributedString *)attributeFontSize:(CGFloat)fontSize subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    }
    return mString;
}

// 字体颜色
- (NSMutableAttributedString *)attributeColor:(UIColor *)color textRange:(NSRange)textRange {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSForegroundColorAttributeName value:color range:textRange];
    return mString;
}

// 字体颜色
- (NSMutableAttributedString *)attributeColor:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return mString;
}

// 字体大小/颜色
- (NSMutableAttributedString *)attributeFontSize:(CGFloat)fontSize color:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
        [mString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return mString;
}

// 字体背景色
- (NSMutableAttributedString *)attributeBackgroupColor:(UIColor *)color textRange:(NSRange)textRange {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSForegroundColorAttributeName value:color range:textRange];
    return mString;
}

// 字体背景色
- (NSMutableAttributedString *)attributeBackgroupColor:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return mString;
}

// 字距
- (NSMutableAttributedString *)attributeCharcterDistance:(CGFloat)distance textRange:(NSRange)textRange {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:distance] range:textRange];
    return mString;
}

// 字距
- (NSMutableAttributedString *)attributeCharcterDistance:(CGFloat)distance subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:distance] range:range];
    }
    return mString;
}

// 对齐方式
- (NSMutableAttributedString *)attributeAlignment:(int)alignmentType {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    switch (alignmentType) {
        case 0:
            style.alignment = NSTextAlignmentLeft;
            break;
        case 1:
            style.alignment = NSTextAlignmentCenter;
            break;
        case 2:
            style.alignment = NSTextAlignmentRight;
            break;
        case 3:
            style.alignment = NSTextAlignmentJustified;
            break;
        default:
            style.alignment = NSTextAlignmentNatural;
            break;
    }
    NSArray *ranges = [self ranges:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }
    return mString;
}

// 行间距 + 段落间距
- (NSMutableAttributedString *)attributeLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.paragraphSpacing = paragraphSpace;
    
     NSArray *ranges = [self ranges:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }
    return mString;
}


// 行间距 + 段落间距
- (NSMutableAttributedString *)attributeLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace subText:(NSString *)subText{
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.paragraphSpacing = paragraphSpace;
    
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }
    return mString;
}

// 字距 + 行间距 + 段落间距
- (NSMutableAttributedString *)attributeLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace chacterSpace:(CGFloat)chacterSpace {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.paragraphSpacing = paragraphSpace;
    
    NSArray *ranges = [self ranges:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSParagraphStyleAttributeName value:style range:range];
        [mString addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:chacterSpace] range:range];
    }
    return mString;
}

// 下划线
- (NSMutableAttributedString *)attributeUnderLine:(UIColor *)color {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    NSArray *ranges = [self ranges:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSUnderlineColorAttributeName value:color range:range];
        [mString addAttribute:NSUnderlineStyleAttributeName value:[NSMutableParagraphStyle new] range:range];
    }
    return mString;
}

// 下划线
- (NSMutableAttributedString *)attributeUnderLine:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSUnderlineColorAttributeName value:color range:range];
        [mString addAttribute:NSUnderlineStyleAttributeName value:[NSMutableParagraphStyle new] range:range];
    }
    return mString;
}

// 下划线
- (NSMutableAttributedString *)attributeUnderLine:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSUnderlineColorAttributeName value:color range:range];
    [mString addAttribute:NSUnderlineStyleAttributeName value:[NSMutableParagraphStyle new] range:range];
    return mString;
}

// 删除线 - 实线
- (NSMutableAttributedString *)attributeThroughLine:(UIColor *)color {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    NSArray *ranges = [self ranges:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [mString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
    }
    return mString;
}

// 删除线 - 实线
- (NSMutableAttributedString *)attributeThroughLine:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [mString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
    }
    return mString;
}

// 删除线 - 实线
- (NSMutableAttributedString *)attributeThroughLine:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    [mString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
    return mString;
}

// 删除线 - 虚线
- (NSMutableAttributedString *)attributeDashDotThroughLine:(UIColor *)color {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    NSArray *ranges = [self ranges:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [mString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlinePatternDashDot] range:range];
    }
    return mString;
}

// 删除线 - 虚线
- (NSMutableAttributedString *)attributeDashDotThroughLine:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [mString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlinePatternDashDot] range:range];
    }
    return mString;
}

// 删除线 - 虚线
- (NSMutableAttributedString *)attributeDashDotThroughLine:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    [mString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlinePatternDashDot] range:range];
    return mString;
}

// 字体阴影
- (NSMutableAttributedString *)attributeShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha {
    NSArray *ranges = [self ranges:self];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowOffset = offSize;
    shadow.shadowColor = shadowColor;
    shadow.shadowBlurRadius = alpha;
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSShadowAttributeName value:shadowColor range:range];
    }
    
    return mString;
}

// 字体阴影
- (NSMutableAttributedString *)attributeShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha subString:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowOffset = offSize;
    shadow.shadowColor = shadowColor;
    shadow.shadowBlurRadius = alpha;
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSShadowAttributeName value:shadowColor range:range];
    }
    
    return mString;
}

// 字体阴影
- (NSMutableAttributedString *)attributeShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha range:(NSRange)range {
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowOffset = offSize;
    shadow.shadowColor = shadowColor;
    shadow.shadowBlurRadius = alpha;
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    [mString addAttribute:NSShadowAttributeName value:shadowColor range:range];
    
    return mString;
}

// 字体横竖
- (NSMutableAttributedString *)attributeIsVertical:(BOOL)isVertical {
    NSArray *ranges = [self ranges:self];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSNumber *isVerticalNumber = isVertical == YES ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSVerticalGlyphFormAttributeName value:isVerticalNumber range:range];
    }
    
    return mString;
}

// 字体横竖
- (NSMutableAttributedString *)attributeIsVertical:(BOOL)isVertical subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSNumber *isVerticalNumber = isVertical == YES ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSVerticalGlyphFormAttributeName value:isVerticalNumber range:range];
    }
    
    return mString;
}

// 字体横竖
- (NSMutableAttributedString *)attributeIsVertical:(BOOL)isVertical range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSNumber *isVerticalNumber = isVertical == YES ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0];
    
    [mString addAttribute:NSVerticalGlyphFormAttributeName value:isVerticalNumber range:range];
    
    return mString;
}

// 设置字体描边宽度这样就能使"文字空心"
- (NSMutableAttributedString *)attributeWordsStrokeWidth:(CGFloat)wordsStrokeWidth {
    NSArray *ranges = [self ranges:self];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:wordsStrokeWidth] range:range];
    }
    
    return mString;
}

// 设置字体描边宽度这样就能使"文字空心"
- (NSMutableAttributedString *)attributeWordsStrokeWidth:(CGFloat)wordsStrokeWidth subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:wordsStrokeWidth] range:range];
    }
    
    return mString;
}

// 设置字体描边宽度这样就能使"文字空心"
- (NSMutableAttributedString *)attributeWordsStrokeWidth:(CGFloat)wordsStrokeWidth range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    [mString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:wordsStrokeWidth] range:range];
    return mString;
}

// 文字下沉偏移其他文字
- (NSMutableAttributedString *)attributeBaselineOffset:(CGFloat)offSet {
    NSArray *ranges = [self ranges:self];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
    
    return mString;
}

// 文字下沉偏移其他文字
- (NSMutableAttributedString *)attributeBaselineOffset:(CGFloat)offSet subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
    
    return mString;
}

// 文字下沉偏移其他文字
- (NSMutableAttributedString *)attributeBaselineOffset:(CGFloat)offSet range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    [mString addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    
    return mString;
}

// 文字倾斜
- (NSMutableAttributedString *)attributeSkewOffset:(CGFloat)offSet {
    NSArray *ranges = [self ranges:self];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
    
    return mString;
}

// 文字倾斜
- (NSMutableAttributedString *)attributeSkewOffset:(CGFloat)offSet subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
    
    return mString;
}

// 文字倾斜
- (NSMutableAttributedString *)attributeSkewOffset:(CGFloat)offSet range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    [mString addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    
    return mString;
}

// 文字扁平
- (NSMutableAttributedString *)attributeExpansionOffset:(CGFloat)offSet {
    NSArray *ranges = [self ranges:self];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSExpansionAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
    
    return mString;
}

// 文字扁平
- (NSMutableAttributedString *)attributeExpansionOffset:(CGFloat)offSet subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSExpansionAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
    
    return mString;
}

// 文字扁平
- (NSMutableAttributedString *)attributeExpansionOffset:(CGFloat)offSet range:(NSRange)range {
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    [mString addAttribute:NSExpansionAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    
    return mString;
}

- (NSMutableAttributedString *)linkMarkup:(NSString *)urlString {
    NSArray *ranges = [self ranges:urlString];
    
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [mString addAttribute:NSLinkAttributeName value:urlString range:range];
    }
    
    return mString;
}
@end
