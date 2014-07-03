#import "EPTPodcasterModel.h"

@interface EPTPodcasterModel ()

@property (nonatomic) NSDate *totalTime;
@property (nonatomic, readwrite) NSString *name;

@end

@implementation EPTPodcasterModel

- (instancetype)initWithPodcasterName:(NSString *)name {
    if (self = [super init]) {
        self.totalTime = [NSDate dateWithZeroTime];
        self.name = name;
    }
    
    return self;
}

- (void)addTimeIntervalToTotalTime:(NSTimeInterval)timeInterval {
    self.totalTime = [self.totalTime dateByAddingTimeInterval:timeInterval];
    
    [self.delegate totalTimeUpdatedTo:[self.totalTime defaultDescription]];
}

- (void)updatePercentageBasedOnTotalTimeInterval:(NSTimeInterval)totalTimeInterval {
    [self.delegate percentageUpdatedTo:[self.totalTime timeIntervalSinceZeroTime]/totalTimeInterval];
}

@end
