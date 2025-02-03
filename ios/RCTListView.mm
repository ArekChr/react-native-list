#import "RCTListView.h"
#import "react_native_list-Swift.h"

#import <react/renderer/components/RNListViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNListViewSpec/EventEmitters.h>
#import <react/renderer/components/RNListViewSpec/Props.h>
#import <react/renderer/components/RNListViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RCTListView () <RCTListViewViewProtocol>

@end

@implementation RCTListView {
    ListViewProvider * _listViewProvider;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<ListViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const ListViewProps>();
    _props = defaultProps;
    _listViewProvider = [[ListViewProvider alloc] init];

    self.contentView = _listViewProvider;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<ListViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<ListViewProps const>(props);

    if (newViewProps.items != oldViewProps.items) {
        NSMutableArray *itemsArray = [NSMutableArray array];
        for (const auto &item : newViewProps.items) {
            NSString *objcString = [NSString stringWithUTF8String:item.c_str()];
            [itemsArray addObject:objcString];
        }
        [_listViewProvider setItems:itemsArray];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> ListViewCls(void)
{
    return RCTListView.class;
}

- hexStringToColor:(NSString *)stringToConvert
{
    NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *stringScanner = [NSScanner scannerWithString:noHashString];

    unsigned hex;
    if (![stringScanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

@end
