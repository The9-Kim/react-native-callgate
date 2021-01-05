//
//  CGCrypto256.h
//  CGCrypto
//
//  Created by 허성연 on 2020/10/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGCrypto256 : NSObject
- (instancetype)init;
- (NSString*)encryptAES256:(NSString *)data key:(NSString *)keyString;
- (NSString*)decryptAES256:(NSString *)data key:(NSString *)keyString;
- (NSString*)sha256:(NSString *)data;

@end

NS_ASSUME_NONNULL_END
