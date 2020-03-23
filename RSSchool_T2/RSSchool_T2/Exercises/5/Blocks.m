#import "Blocks.h"

@interface Blocks()
@property (nonatomic, retain) NSArray *objects;
@property (nonatomic, retain) Class class;
@end

@implementation Blocks

- (instancetype)init
{
    self = [super init];
    if (self) {

        self.blockA = ^(NSArray* array){
            self.objects = array;
        };
        self.blockB = ^(Class class) {
            self.class = class;
        };
        self.blockC = ^(NSObject *result) {
           // if
            
        };
        
    }
    return self;
}

- (NSInteger)sumOfObjects {
    NSInteger sum = 0;
    NSArray<NSNumber *> *numbers = (NSArray<NSNumber *> *)self.objects;
    
    for (NSNumber *number in numbers) {
        sum += number.integerValue;
    }
    
    return sum;
}

@end

