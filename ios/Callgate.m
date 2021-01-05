#import "Callgate.h"
#import <CQClient/CQClient.h>

@implementation Callgate

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(updateAgreementInfoWithAgreeState:(BOOL)agreeState
                  appName: (NSString *) appName
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject) {

    CQClient *client = [[CQClient alloc] init];
    [client updateAgreementInfoWithAgreeState:agreeState appName: appName completion:^(CQClientResultCode resultCode) {
        NSLog(@"resultCode = %ld", (long)resultCode);
        long code = (long)resultCode;
        if ( code == 0 ) {
            resolve(code);
        } else {
            reject(code);
        }
    }];
}

RCT_EXPORT_METHOD(setMDN:(NSString *)mdn)
{
    CQClient *client = [[CQClient alloc] init];
    [client setMDN: mdn];

    //FIXME: 성공 실패 결과 리턴 할 것
}

@end
