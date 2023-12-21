import {IVpc} from "aws-cdk-lib/aws-ec2";
import {StackProps} from "aws-cdk-lib";

export interface GlobalProps extends StackProps{
  dbUser:string,
  dbPassword:string,
}
