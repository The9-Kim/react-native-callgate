import { NativeModules } from 'react-native';

type CallgateType = {
  updateAgreementInfo(agreeState: boolean, appName: string): Promise<number>;
  setMDN(mdn: string): boolean;
};

const { Callgate } = NativeModules;

export default Callgate as CallgateType;
