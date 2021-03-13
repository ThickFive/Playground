//
//  main.m
//  OCTest
//
//  Created by 童航 on 2021/3/12.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDate *start = [NSDate new];
        NSLog(@"%@", start);
        
        long long count = 0;
        for (int i = 0; i < 50; i++) {
            for (int j = 0; j < 10000; j++) {
                for (int k = 0; k < 10000; k++) {
                    if (k > 5000) {
                        count++;
                    }
                }
            }
        }
        NSLog(@"%lld", count);
        NSDate *end = [NSDate new];
        NSLog(@"%@: Test end in %dms", end,  (int)((end.timeIntervalSince1970 - start.timeIntervalSince1970)*1000));
    }
    return 0;
}
