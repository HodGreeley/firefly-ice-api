//
//  FDHardwareId.m
//  FireflyDevice
//
//  Created by Denis Bohm on 3/2/14.
//  Copyright (c) 2014 Firefly Design. All rights reserved.
//

#import "FDHardwareId.h"

@implementation FDHardwareId

+ (NSString *)hardwareId:(NSData *)unique
{
    NSMutableString *hardwareId = [NSMutableString stringWithString:@"FireflyIce-"];
    uint8_t *bytes = (uint8_t *)unique.bytes;
    for (NSUInteger i = 0; i < unique.length; ++i) {
		uint8_t byte = bytes[i];
        [hardwareId appendFormat:@"%02X", byte];
	}
    return hardwareId;
}

@end
