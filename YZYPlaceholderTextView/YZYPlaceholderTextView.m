//
//  YZYPlaceholderTextView.m
//  YZYPlaceholderTextView
//
//  Created by 杨志远 on 16/11/14.
//  Copyright © 2016年 杨志远. All rights reserved.
//

#import "YZYPlaceholderTextView.h"
static CGFloat const YZYPlaceholderLabelX = 6.0;
static CGFloat const YZYPlaceholderLabelY = 7.0;

#define YZYPlaceholderLabelW self.frame.size.width - 2 * YZYPlaceholderLabelX
@interface YZYPlaceholderTextView()

@property(nonatomic,strong)UILabel *placeholderLabel;



@end

@implementation YZYPlaceholderTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame: frame])
    {
        [self setUp];
    }
    return self;
}


-(void)setUp
{
    self.font = [UIFont systemFontOfSize:17];
    
    self.placeholderColor = [UIColor grayColor];
    
    [self addSubview:self.placeholderLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification) name:UITextViewTextDidChangeNotification object:nil];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

-(UILabel *)placeholderLabel
{
    if (!_placeholderLabel)
    {
        _placeholderLabel = [[UILabel alloc]init];
        
        _placeholderLabel.numberOfLines = 0;
        [self.placeholderLabel sizeToFit];

    }
    return _placeholderLabel;
}


-(void)textDidChangeNotification
{
    self.placeholderLabel.hidden = self.hasText;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];

    self.placeholderLabel.frame = CGRectMake(YZYPlaceholderLabelX, YZYPlaceholderLabelY, YZYPlaceholderLabelW, 0);
    
    [self.placeholderLabel sizeToFit];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
