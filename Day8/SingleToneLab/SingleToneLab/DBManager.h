//
//  DBManager.h
//  SingleToneLab
//
//  Created by JETS Mobile Lab - 2 on 5/2/19.
//  Copyright © 2019 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBManager : NSObject
+(DBManager *) sharedInstance;
@end

NS_ASSUME_NONNULL_END
