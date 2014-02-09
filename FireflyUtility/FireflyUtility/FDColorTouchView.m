//
//  FDColorTouchView.m
//  FireflyUtility
//
//  Created by Denis Bohm on 2/7/14.
//  Copyright (c) 2014 Firefly Design. All rights reserved.
//

#import "FDColorTouchView.h"

@implementation FDColorTouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.opaque = NO;
		self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setColor:(UIColor *)color
{
	if (![_color isEqual:color]) {
		_color = color;
		
		[self setNeedsDisplay];
	}
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGPoint center = {CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)};
	CGFloat radius = CGRectGetMidX(self.bounds);
	
	CGContextAddArc(context, center.x, center.y, radius - 1.0f, 0.0f, 2.0f * (float)M_PI, YES);
	[self.color setFill];
	CGContextFillPath(context);
    
	// Stroke it (black transucent, inner):
	CGContextAddArc(context, center.x, center.y, radius - 1.0f, 0.0f, 2.0f * (float)M_PI, YES);
	CGContextSetGrayStrokeColor(context, 0.0f, 0.5f);
	CGContextSetLineWidth(context, 2.0f);
	CGContextStrokePath(context);
    
	// Stroke it (white, outer):
	CGContextAddArc(context, center.x, center.y, radius - 2.0f, 0.0f, 2.0f * (float)M_PI, YES);
	CGContextSetGrayStrokeColor(context, 1.0f, 1.0f);
	CGContextSetLineWidth(context, 2.0f);
	CGContextStrokePath(context);
}

@end
