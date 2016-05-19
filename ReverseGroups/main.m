//
//  main.m
//  ReverseGroups


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *line = @"58,59,60,61,62,63,64,65,66,67,68,69;7";
        
        NSArray *semiColonSep = [line componentsSeparatedByString:@";"];
        
        NSInteger reverseSegmentLength = [[semiColonSep objectAtIndex:1] integerValue];
        
        NSArray *arrayOfNumStringsToReverse = [[semiColonSep objectAtIndex:0] componentsSeparatedByString:@","];
        
        NSInteger oddCountOfLastArray = arrayOfNumStringsToReverse.count % reverseSegmentLength;
        NSLog(@"oddCountOfLastArray: %ld", oddCountOfLastArray);
        
        NSInteger numberOfSegmentsToReverse = arrayOfNumStringsToReverse.count / reverseSegmentLength;
        
        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        // reverse full length sements
        NSInteger i = 0;
        for (i = 0; i < numberOfSegmentsToReverse; i++) {
            
            NSInteger j = 0;
            for (j = 0; j < reverseSegmentLength; j++) {
                NSString *numString = [arrayOfNumStringsToReverse objectAtIndex: i * reverseSegmentLength + reverseSegmentLength - 1 - j];
                
                NSLog(@"numString: %@", numString);
                
               [solutionString appendFormat:@"%@,", numString];
            }
        }
        
        // reverse last partial segment
        if (oddCountOfLastArray != 0) {
            NSInteger l = 0;
            for (l = 0; l < oddCountOfLastArray; l++) {
                NSString *numString = [arrayOfNumStringsToReverse objectAtIndex:arrayOfNumStringsToReverse.count - oddCountOfLastArray + l];
                [solutionString appendFormat:@"%@,", numString];
            }
        }
        NSRange lastCommaRange = NSMakeRange(solutionString.length - 1, 1);
        [solutionString deleteCharactersInRange:lastCommaRange];
        NSLog(@"solutionString: %@", solutionString);
        
    }
    return 0;
}
