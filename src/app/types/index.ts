import {SVGProps} from "react";

export type IconSvgProps = SVGProps<SVGSVGElement> & {
  size?: number;
};

export type Users = {
  data: UserData[],
  count: number,
}

export interface UserData {
  id: string,
  status: string,
  firstName: string,
  lastName: string,
  email: string,
  phoneNumber: bigint,
  type: string,
  country: string,
  [key: string]: string | bigint;
}