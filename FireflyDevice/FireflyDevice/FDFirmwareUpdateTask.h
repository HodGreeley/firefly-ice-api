//
//  FDFirmwareUpdateTask.h
//  Sync
//
//  Created by Denis Bohm on 9/14/13.
//  Copyright (c) 2013 Firefly Design. All rights reserved.
//

#import "FDFireflyIceTaskSteps.h"

@class FDFirmwareUpdateTask;

@protocol FDFirmwareUpdateTaskDelegate <NSObject>

- (void)firmwareUpdateTask:(FDFirmwareUpdateTask *)task progress:(float)progress;

- (void)firmwareUpdateTask:(FDFirmwareUpdateTask *)task complete:(BOOL)isFirmwareUpToDate;

@end

@class FDIntelHex;

@interface FDFirmwareUpdateTask : FDFireflyIceTaskSteps

+ (FDFirmwareUpdateTask *)firmwareUpdateTask:(FDFireflyIce *)fireflyIce channel:(id<FDFireflyIceChannel>)channel firmware:(NSData *)firmware;

+ (FDIntelHex *)loadFirmware:(NSString *)resource;

+ (FDFirmwareUpdateTask *)firmwareUpdateTask:(FDFireflyIce *)fireflyIce channel:(id<FDFireflyIceChannel>)channel intelHex:(FDIntelHex *)intelHex;

+ (FDFirmwareUpdateTask *)firmwareUpdateTask:(FDFireflyIce *)fireflyIce channel:(id<FDFireflyIceChannel>)channel resource:(NSString *)resource;

+ (FDFirmwareUpdateTask *)firmwareUpdateTask:(FDFireflyIce *)fireflyIce channel:(id<FDFireflyIceChannel>)channel;

// firmware must start at firmware address and be a multiple of the page size (2048)
@property NSData *firmware;
@property BOOL downgrade;
@property BOOL commit;
@property BOOL reset;
@property uint16_t major;
@property uint16_t minor;
@property uint16_t patch;

@property id<FDFirmwareUpdateTaskDelegate> delegate;

@property(readonly) uint32_t sectorSize;
@property(readonly) uint32_t pageSize;
@property(readonly) uint32_t pagesPerSector;

@property(readonly) NSArray *usedSectors;
@property(readonly) NSArray *invalidSectors;
@property(readonly) NSArray *invalidPages;

@property(readonly) NSMutableArray *updateSectors;
@property(readonly) NSMutableArray *updatePages;

@property(readonly) FDFireflyIceUpdateCommit *updateCommit;

@end
