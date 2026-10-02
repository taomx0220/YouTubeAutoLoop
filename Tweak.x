// YouTubeAutoLoop20
// Target: official YouTube iOS 20.21.6 / iOS 15
// Automatically forces single-video loop mode for every video.

#import <Foundation/Foundation.h>

@interface YTAutoplayAutonavController : NSObject
- (id)initWithParentResponder:(id)arg1;
- (NSInteger)loopMode;
- (void)setLoopMode:(NSInteger)loopMode;
@end

static BOOL YT20IsTargetVersion(void) {
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return [version isEqualToString:@"20.21.6"];
}

%hook YTAutoplayAutonavController

- (id)initWithParentResponder:(id)arg1 {
    self = %orig;
    if (self && YT20IsTargetVersion()) {
        [self setLoopMode:2];
    }
    return self;
}

- (void)setLoopMode:(NSInteger)loopMode {
    if (YT20IsTargetVersion()) {
        %orig(2);
    } else {
        %orig(loopMode);
    }
}

%end
