import { NativeModules } from 'react-native';

type CallgateType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Callgate } = NativeModules;

export default Callgate as CallgateType;
