#import <Foundation/Foundation.h>
#import <Mapbox/Mapbox.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NSString *const MBXCamera;
FOUNDATION_EXTERN NSString *const MBXUserTrackingMode;
FOUNDATION_EXTERN NSString *const MBXShowsUserLocation;
FOUNDATION_EXTERN NSString *const MBXDebugMaskValue;
FOUNDATION_EXTERN NSString *const MBXShowsZoomLevelHUD;
FOUNDATION_EXTERN NSString *const MBXShowsZoomLevelOrnament;
FOUNDATION_EXTERN NSString *const MBXShowsTimeFrameGraph;
FOUNDATION_EXTERN NSString *const MBXDebugLoggingEnabled;
FOUNDATION_EXTERN NSString *const MBXShowsMapScale;
FOUNDATION_EXTERN NSString *const MBXMapShowsHeadingIndicator;
FOUNDATION_EXTERN NSString *const MBXMapFramerateMeasurementEnabled;

@interface MBXState : NSObject

@property (nonatomic, nullable) MGLMapCamera *camera;
@property (nonatomic) MGLUserTrackingMode userTrackingMode;
@property (nonatomic) BOOL showsUserLocation;
@property (nonatomic) MGLMapDebugMaskOptions debugMask;
@property (nonatomic) BOOL showsZoomLevelOrnament;
@property (nonatomic) BOOL showsTimeFrameGraph;
@property (nonatomic) BOOL debugLoggingEnabled;
@property (nonatomic) BOOL showsMapScale;
@property (nonatomic) BOOL showsUserHeadingIndicator;
@property (nonatomic) BOOL framerateMeasurementEnabled;

@property (nonatomic, readonly) NSString *debugDescription;

@end

NS_ASSUME_NONNULL_END
