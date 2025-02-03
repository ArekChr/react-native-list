#import <React/RCTViewManager.h>
#import "RCTListView.h"

@interface ListViewManager : RCTViewManager
@end

@implementation ListViewManager

RCT_EXPORT_MODULE(RCTListView)

RCT_EXPORT_VIEW_PROPERTY(items, NSArray)

- (UIView *)view {
  return [[RCTListView alloc] init];
}

@end
