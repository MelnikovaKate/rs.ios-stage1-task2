#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    if([month intValue] <= 12){
            if([month intValue] == 1 || [month intValue] == 3 || [month intValue] == 5 || [month intValue] == 7 || [month intValue] == 8 || [month intValue] == 10 || [month intValue] == 12 && [day intValue] > 0 && [day intValue] <= 31){
                
                NSString* result = [Dates Day:day Month:month Year:year];
                
                return result;
            } else if([month intValue] == 2){
                if(([year intValue] % 4 != 0 || [year intValue] % 100 == 0 && [year intValue] % 400 != 0) && ([day intValue] > 0 && [day intValue] <= 28)){
                    NSString* result = [Dates Day:day Month:month Year:year];
                    return result;
                } else if ([year intValue] % 4 == 0 || ([year intValue] % 100 != 0 && [year intValue] % 400 == 0 && [day intValue] > 0 && [day intValue] <= 29)){
                    NSString* result = [Dates Day:day Month:month Year:year];
                    return result;
                } else return @"Такого дня не существует";
            }
            else if([month intValue] == 3 || [month intValue] == 4 || [month intValue] == 6 || [month intValue] == 9 || [month intValue] == 11 && [day intValue] > 0 && [day intValue] <= 30){
                    NSString* result = [Dates Day:day Month:month Year:year];
                    return result;
            }
            return @"Такого дня не существует";
        }
        else return @"Такого дня не существует";
    }

    + (NSString *)Day:(NSString *)day Month:(NSString *)month Year:(NSString *)year{
        
        NSDateComponents* comps = [[NSDateComponents alloc] init];
        
        comps.day = [day intValue];
        comps.month = [month intValue];
        comps.year = [year intValue];
               
        NSCalendar* calendar = [NSCalendar currentCalendar];
               
        NSDate* date = [calendar dateFromComponents:comps];
               
        NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
               
        [formatDate setDateFormat:@"dd MMMM, EEEE"];
               
        formatDate.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
               
        NSString *stringDate = [formatDate stringFromDate:date];
           
        return stringDate;
    }

@end
