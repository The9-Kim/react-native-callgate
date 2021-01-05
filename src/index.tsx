import { NativeModules } from 'react-native';

type CallgateType = {
  updateAgreementInfoWithAgreeState(agreeState: boolean, appName: string): Promise<number>;
  setMDN(mdn: string): boolean;
};

const { Callgate } = NativeModules;

export default Callgate as CallgateType;
