#import "EPTPodcasterModel.h"

@interface EPTPodcasterModel ()

@property (nonatomic) NSDate *totalTime;
@property (nonatomic, readwrite) NSString *name;

@end

@implementation EPTPodcasterModel

- (instancetype)initWithPodcasterName:(NSString *)name {
    if (self = [super init]) {
        
        NSString *startString = @"00:00:00";
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:DateTimeFormatString];
        self.totalTime = [formatter dateFromString:startString];
        self.name = name;
    }
    
    return self;
}

- (void)addTimeIntervalToTotalTime:(NSTimeInterval)timeInterval {
    self.totalTime = [self.totalTime dateByAddingTimeInterval:timeInterval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DateTimeFormatString];
    NSString *date = [formatter stringFromDate:self.totalTime];
    [self.delegate totalTimeUpdatedTo:date];
}

@end
