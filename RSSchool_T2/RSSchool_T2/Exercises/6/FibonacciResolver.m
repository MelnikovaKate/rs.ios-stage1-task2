#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
   NSArray *arrayFibonacci = [NSArray arrayWithObjects:@0, @1, @1, @2, @3, @5, @8, @13, @21, @34, @55, @89, @144, @233, nil];
        
    NSNumber *flag = nil;
    NSArray *resultArray = nil;
    NSNumber *firstNumber = nil, *secondNumber = nil;
    
    for(int i = 2; i < arrayFibonacci.count; i++){
        
        NSNumber *resultNumber = @([arrayFibonacci[i - 2] intValue] * [arrayFibonacci[i - 1] intValue]);
        
        if([resultNumber intValue] == [number intValue]){
            flag = @1;
            firstNumber = @([arrayFibonacci[i - 2] intValue]);
            secondNumber = @([arrayFibonacci[i - 1] intValue]);
            break;
        } else if ([resultNumber intValue] > [number intValue]){
            flag = @0;
            firstNumber = @([arrayFibonacci[i - 2] intValue]);
            secondNumber = @([arrayFibonacci[i - 1] intValue]);
            break;
        }
    }
    resultArray = [NSArray arrayWithObjects:firstNumber, secondNumber, flag, nil];
    
    return resultArray;
}
@end
