In Objective-C, a common yet subtle error arises when dealing with `NSDateFormatter`.  Specifically, it's related to thread safety and locale settings. If you create an `NSDateFormatter` instance and use it across multiple threads without proper synchronization, you'll likely encounter unexpected date/time formatting inconsistencies.  This is because `NSDateFormatter` isn't thread-safe; modifying its properties (like `dateFormat` or `locale`) from different threads concurrently can lead to data corruption or crashes.  Furthermore, different locales can interpret date formats differently, causing further issues if not explicitly managed.

Example of problematic code:

```objectivec
@interface MyObject : NSObject
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation MyObject
- (instancetype)init {
    self = [super init];
    if (self) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@