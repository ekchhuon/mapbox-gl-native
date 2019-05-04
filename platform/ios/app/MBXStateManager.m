#import "MBXStateManager.h"
#import <Mapbox/Mapbox.h>
#import "MBXState.h"
#import "MBXViewController.h"

@interface MBXStateManager()

@property (strong, nonatomic) MBXState *currentState;

@end

@implementation MBXStateManager

+ (instancetype) sharedManager {
    static dispatch_once_t once;
    static MBXStateManager* sharedManager;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });

    return sharedManager;
}

- (MBXState*)currentState {

    if (!_currentState) {
        _currentState = [[MBXState alloc] init];

        NSMutableDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"mapStateKey"];
        
        if (dictionary[MBXCamera]) {
            MGLMapCamera *unpackedCamera = [NSKeyedUnarchiver unarchiveObjectWithData:dictionary[MBXCamera]];
            _currentState.camera = unpackedCamera;
        }

        if (dictionary[MBXUserTrackingMode]) {
            _currentState.userTrackingMode = [dictionary[MBXUserTrackingMode] boolValue];
        }

        if (dictionary[MBXShowsUserLocation]) {
            _currentState.showsUserLocation = [dictionary[MBXShowsUserLocation] boolValue];
        }

        if (dictionary[MBXDebugMaskValue]) {
            _currentState.debugMask = ((NSNumber *)dictionary[MBXDebugMaskValue]).intValue;
        }

        if (dictionary[MBXShowsZoomLevelOrnament]) {
            _currentState.showsZoomLevelOrnament = [dictionary[MBXShowsZoomLevelOrnament] boolValue];
        }

        if (dictionary[MBXShowsTimeFrameGraph]) {
            _currentState.showsTimeFrameGraph = [dictionary[MBXShowsTimeFrameGraph] boolValue];
        }

        if (dictionary[MBXDebugLoggingEnabled]) {
            _currentState.debugLoggingEnabled = [dictionary[MBXDebugLoggingEnabled] boolValue];
        }

        if (dictionary[MBXShowsMapScale]) {
            _currentState.showsMapScale = [dictionary[MBXShowsMapScale] boolValue];
        }

        if (dictionary[MBXMapShowsHeadingIndicator]) {
            _currentState.showsUserHeadingIndicator = [dictionary[MBXMapShowsHeadingIndicator] boolValue];
        }

        if (dictionary[MBXMapFramerateMeasurementEnabled]) {
            _currentState.framerateMeasurementEnabled = [dictionary[MBXMapFramerateMeasurementEnabled] boolValue];
        }

        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return _currentState;
}

- (void)saveState:(MBXViewController*)mapViewController {
    MGLMapView *mapView = mapViewController.mapView;

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    NSData *cameraData = [NSKeyedArchiver archivedDataWithRootObject:mapView.camera];
    [dictionary setObject:cameraData forKey:MBXCamera];
    [dictionary setValue:@(mapView.userTrackingMode) forKey:MBXUserTrackingMode];
    [dictionary setValue:@(mapView.showsUserLocation) forKey:MBXShowsUserLocation];
    [dictionary setValue:@(mapView.debugMask) forKey:MBXDebugMaskValue];
    [dictionary setValue:@(mapViewController.showsZoomLevelOrnament) forKey:MBXShowsZoomLevelOrnament];
    [dictionary setValue:@(mapViewController.showsTimeFrameGraph) forKey:MBXShowsTimeFrameGraph];
    [dictionary setValue:@(mapViewController.debugLoggingEnabled) forKey:MBXDebugLoggingEnabled];
    [dictionary setValue:@(mapView.showsScale) forKey:MBXShowsMapScale];
    [dictionary setValue:@(mapView.showsUserHeadingIndicator) forKey:MBXMapShowsHeadingIndicator];
    [dictionary setValue:@(mapViewController.framerateMeasurementEnabled) forKey:MBXMapFramerateMeasurementEnabled];

    [[NSUserDefaults standardUserDefaults] setObject:dictionary forKey:@"mapStateKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)resetState {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mapStateKey"];
}



@end
