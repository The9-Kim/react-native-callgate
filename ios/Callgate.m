#import "Callgate.h"
#import <CQClient/CQClient.h>

@implementation Callgate

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_REMAP_METHOD(updateAgreementInfo,
                 updateAgreementInfoWithAgreeState:(BOOL)agreeState
                 appName: (NSString *) appName
                 resolver: (RCTPromiseResolveBlock) resolve
                 rejecter: (RCTPromiseRejectBlock) reject)
{
    CQClient *client = [[CQClient alloc] init];
    [client updateAgreementInfoWithAgreeState:agreeState appName: appName completion:^(CQClientResultCode resultCode) {
        NSLog(@"resultCode = %ld", (long)resultCode);
        long code = (long)resultCode;
        NSString *codeStr = [NSString stringWithFormat:@"%ld", code];
        if ( code == 0 ) {
            resolve(codeStr);
        } else {
            reject(codeStr, codeStr, nil);
        }
    }];
}

RCT_REMAP_METHOD(setMDN,
                 setMDN:(NSString *)mdn)
{
    CQClient *client = [[CQClient alloc] init];
    [client setMDN: mdn];

    //FIXME: 성공 실패 결과 리턴 할 것
}

@end
