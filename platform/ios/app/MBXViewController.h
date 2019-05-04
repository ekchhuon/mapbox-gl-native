#import <UIKit/UIKit.h>
@class MBXState;
@class MGLMapView;

@interface MBXViewController : UIViewController

@property (nonatomic) MBXState *currentState;
@property (nonatomic, readonly) IBOutlet MGLMapView *mapView;
@property (nonatomic, readonly) BOOL showsZoomLevelOrnament;
@property (nonatomic, readonly) BOOL showsTimeFrameGraph;
@property (nonatomic, readonly) BOOL debugLoggingEnabled;
@property (nonatomic, readonly) BOOL framerateMeasurementEnabled;

@end
