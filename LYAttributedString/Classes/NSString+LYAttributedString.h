//
//  NSString+CHAttributedString.h
//
//  Created by yons on 16/8/25.
//  Copyright © 2016年 iOS Coding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LYAttributedString)

// 字体大小
- (NSMutableAttributedString *)attributeFontSize:(CGFloat)fontSize textRange:(NSRange)textRange;

// 字体大小
- (NSMutableAttributedString *)attributeFontSize:(CGFloat)fontSize subText:(NSString *)subText;

// 字体颜色
- (NSMutableAttributedString *)attributeColor:(UIColor *)color textRange:(NSRange)textRange;

// 字体颜色
- (NSMutableAttributedString *)attributeColor:(UIColor *)color subText:(NSString *)subText;

// 字体大小/颜色
- (NSMutableAttributedString *)attributeFontSize:(CGFloat)fontSize color:(UIColor *)color subText:(NSString *)subText;

// 字体背景色
- (NSMutableAttributedString *)attributeBackgroupColor:(UIColor *)color textRange:(NSRange)textRange;

// 字体背景色
- (NSMutableAttributedString *)attributeBackgroupColor:(UIColor *)color subText:(NSString *)subText;

// 字距
- (NSMutableAttributedString *)attributeCharcterDistance:(CGFloat)distance textRange:(NSRange)textRange;

// 字距
- (NSMutableAttributedString *)attributeCharcterDistance:(CGFloat)distance subText:(NSString *)subText;

// 对齐方式
- (NSMutableAttributedString *)attributeAlignment:(int)alignmentType;

// 行间距 + 段落间距
- (NSMutableAttributedString *)attributeLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace;

// 行间距 + 段落间距
- (NSMutableAttributedString *)attributeLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace subText:(NSString *)subText;

// 字距 + 行间距 + 段落间距
- (NSMutableAttributedString *)attributeLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace chacterSpace:(CGFloat)chacterSpace;

// 下划线
- (NSMutableAttributedString *)attributeUnderLine:(UIColor *)color;

// 下划线
- (NSMutableAttributedString *)attributeUnderLine:(UIColor *)color subText:(NSString *)subText;

// 下划线
- (NSMutableAttributedString *)attributeUnderLine:(UIColor *)color range:(NSRange)range;

// 删除线 - 实线
- (NSMutableAttributedString *)attributeThroughLine:(UIColor *)color;


// 删除线 - 实线
- (NSMutableAttributedString *)attributeThroughLine:(UIColor *)color subText:(NSString *)subText;

// 删除线 - 实线
- (NSMutableAttributedString *)attributeThroughLine:(UIColor *)color range:(NSRange)range;

// 删除线 - 虚线
- (NSMutableAttributedString *)attributeDashDotThroughLine:(UIColor *)color;

// 删除线 - 虚线
- (NSMutableAttributedString *)attributeDashDotThroughLine:(UIColor *)color subText:(NSString *)subText;

// 删除线 - 虚线
- (NSMutableAttributedString *)attributeDashDotThroughLine:(UIColor *)color range:(NSRange)range;

// 字体阴影
- (NSMutableAttributedString *)attributeShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha;

// 字体阴影
- (NSMutableAttributedString *)attributeShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha subString:(NSString *)subText;

// 字体阴影
- (NSMutableAttributedString *)attributeShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha range:(NSRange)range;

// 字体横竖
- (NSMutableAttributedString *)attributeIsVertical:(BOOL)isVertical;

// 字体横竖
- (NSMutableAttributedString *)attributeIsVertical:(BOOL)isVertical subText:(NSString *)subText;

// 字体横竖
- (NSMutableAttributedString *)attributeIsVertical:(BOOL)isVertical range:(NSRange)range;

// 设置字体描边宽度这样就能使"文字空心"
- (NSMutableAttributedString *)attributeWordsStrokeWidth:(CGFloat)wordsStrokeWidth;

// 设置字体描边宽度这样就能使"文字空心"
- (NSMutableAttributedString *)attributeWordsStrokeWidth:(CGFloat)wordsStrokeWidth subText:(NSString *)subText;

// 设置字体描边宽度这样就能使"文字空心"
- (NSMutableAttributedString *)attributeWordsStrokeWidth:(CGFloat)wordsStrokeWidth range:(NSRange)range;

// 文字下沉偏移其他文字
- (NSMutableAttributedString *)attributeBaselineOffset:(CGFloat)offSet;

// 文字下沉偏移其他文字
- (NSMutableAttributedString *)attributeBaselineOffset:(CGFloat)offSet subText:(NSString *)subText;

// 文字下沉偏移其他文字
- (NSMutableAttributedString *)attributeBaselineOffset:(CGFloat)offSet range:(NSRange)range;

// 文字倾斜
- (NSMutableAttributedString *)attributeSkewOffset:(CGFloat)offSet;

// 文字倾斜
- (NSMutableAttributedString *)attributeSkewOffset:(CGFloat)offSet subText:(NSString *)subText;

// 文字倾斜
- (NSMutableAttributedString *)attributeSkewOffset:(CGFloat)offSet range:(NSRange)range;

// 文字扁平
- (NSMutableAttributedString *)attributeExpansionOffset:(CGFloat)offSet;

// 文字扁平
- (NSMutableAttributedString *)attributeExpansionOffset:(CGFloat)offSet subText:(NSString *)subText;

// 文字扁平
- (NSMutableAttributedString *)attributeExpansionOffset:(CGFloat)offSet range:(NSRange)range;

// 超链接样式
- (NSMutableAttributedString *)linkMarkup:(NSString *)urlString;

@end
