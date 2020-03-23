#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSDictionary *hoursDictionary = @{@"1" : @"one", @"2" : @"two", @"3" : @"three",
                                          @"4" : @"four", @"5" : @"five", @"6" : @"six",
                                          @"7" : @"seven", @"8" : @"eight", @"9" : @"nine",
                                          @"10" : @"ten", @"11" : @"eleven", @"12" : @"twelve"};
        
    NSDictionary *minutesDictionary = @{@"01" : @"one", @"02" : @"two", @"03" : @"three", @"04" : @"four", @"05" : @"five", @"06" : @"six",
                                            @"07" : @"seven", @"08" : @"eight", @"09" : @"nine", @"10" : @"ten", @"11" : @"eleven", @"12" : @"twelve",
                                            @"13" : @"thirteen", @"14" : @"fourteen", @"15" : @"fifteen", @"16" : @"sixteen", @"17" : @"seventeen",
                                            @"18" : @"eighteen", @"19" : @"nineteen", @"20" : @"twenty", @"21" : @"twenty one", @"22" : @"twenty two",
                                            @"23" : @"twenty three", @"24" : @"twenty four", @"25" : @"twenty five", @"26" : @"twenty six", @"27" : @"twenty seven", @"28" : @"twenty eight", @"29" : @"twenty nine", @"30" : @"thirty", @"31" : @"thirty one", @"32" : @"thirty two", @"33" : @"thirty three", @"34" : @"thirty four", @"35" : @"thirty five",
                                            @"36" : @"thirty six", @"37" : @"thirty seven", @"38" : @"thirty eight", @"39" : @"thirty nine", @"40" : @"forty", @"41" : @"forty one", @"42" : @"forty two", @"43" : @"forty three", @"44" : @"forty four",
                                            @"45" : @"forty five", @"46" : @"forty six", @"47" : @"forty seven", @"48" : @"forty eight", @"49" : @"forty nine", @"50" : @"fifty", @"51" : @"fifty one", @"52" : @"fifty two", @"53" : @"fifty three",
                                            @"54": @"fifty four", @"55" : @"fifty five", @"56" : @"fifty six", @"57" : @"fifty seven", @"58" : @"fifty eight", @"59" : @"fifty nine"};
        
    NSString *result = @"";
    NSString *resultHour = @"";
    NSString *resultMinute = @"";
        
    NSString *forZeroMinutes = @"o' clock";
    NSString *forMiddleMinute = @"minute past";
    NSString *forMiddleMinutes = @"minutes past";
    NSString *forBiggestMinutes = @"minutes to";
    NSString *forMiddleQuarterMinutes = @"quarter past";
    NSString *forBiggestQuarterMinutes = @"quarter to";
    NSString *forHalfMinutes = @"half past";
        

    id objectHour = [hoursDictionary objectForKey:hours];
    id objectMinute = [minutesDictionary objectForKey:minutes];
        
    NSNumber *hour = @(((NSString *)hours).integerValue + 1);
    NSString* str = [NSString stringWithFormat:@"%@", hour];
       
        
            if([minutes intValue] >= 00 && [minutes intValue] <= 59 && [hours intValue] > 00 && [hours intValue] <= 11 ){
                if([minutes intValue] == 00){
                    resultHour = objectHour;
                    result = [NSString stringWithFormat: @"%@ %@", resultHour, forZeroMinutes];
                        
                } else if ([minutes intValue] >= 01 && [minutes intValue] <= 30 ){
                    if([minutes intValue] == 01){
                        resultMinute = objectMinute;
                        resultHour = objectHour;
                        result = [NSString stringWithFormat: @"%@ %@ %@", resultMinute, forMiddleMinute , resultHour];
                    } else if([minutes intValue] == 15){
                        resultHour = objectHour;
                        result = [NSString stringWithFormat: @"%@ %@", forMiddleQuarterMinutes, resultHour];
                    } else if([minutes intValue] == 30){
                        resultHour = objectHour;
                        result = [NSString stringWithFormat: @"%@ %@", forHalfMinutes, resultHour];
                    } else{
                        resultMinute = objectMinute;
                        resultHour = objectHour;
                        result = [NSString stringWithFormat: @"%@ %@ %@", resultMinute, forMiddleMinutes, resultHour];
                    }
                        
                } else if ([minutes intValue] > 30){
                    if([minutes intValue] == 45){
                        resultHour = [hoursDictionary objectForKey:str];
                        result = [NSString stringWithFormat: @"%@ %@", forBiggestQuarterMinutes, resultHour];
                    } else if([minutes intValue] > 50){
                        NSString *diffMinutes = [NSString stringWithFormat:@"%@", @(60 - minutes.intValue)];
                        NSString *newDiffMinute = [NSString stringWithFormat:@"%s%@","0", diffMinutes];
                        resultMinute = [minutesDictionary objectForKey:newDiffMinute];
                        resultHour = [hoursDictionary objectForKey:str];
                        result = [NSString stringWithFormat: @"%@ %@ %@", resultMinute, forBiggestMinutes, resultHour];
                    } else{
                        NSString *diffMinutes = [NSString stringWithFormat:@"%@", @(60 - minutes.intValue)];
                        resultMinute = [minutesDictionary objectForKey:diffMinutes];
                        resultHour = [hoursDictionary objectForKey:str];
                        result = [NSString stringWithFormat: @"%@ %@ %@", resultMinute, forBiggestMinutes, resultHour];
                    }
                }
            } else return @"";
    return result;
}
@end
