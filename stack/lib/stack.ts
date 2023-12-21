import * as cdk from 'aws-cdk-lib';
import {SecretValue, StackProps} from 'aws-cdk-lib';
import {Construct} from 'constructs';
import * as iam from 'aws-cdk-lib/aws-iam';
import * as ec2 from "aws-cdk-lib/aws-ec2";
import * as fs from 'fs';
import {
  CaCertificate,
  Credentials,
  DatabaseInstance,
  DatabaseInstanceEngine,
  MysqlEngineVersion
} from 'aws-cdk-lib/aws-rds';


require('dotenv').config();

const config = {
  env: {
    region: process.env['AWS_REGION'],
    dbUser: process.env['dbUser'],
    dbPassword: process.env['dbPassword'],
    keyName: process.env['keyName'],
    agent: process.env['agent'],
    url: process.env['url'],
    token: process.env['token'],
    pool: process.env['pool'],
    agentName: process.env['agentName'] ? process.env['agentName'] : 'db-deploy-agent',
  }
}


export class Stack extends cdk.Stack {
  
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, {...props, env: config.env});
  }
  


  
  
  public deployStack() {
    
    const user = config.env.dbUser!;
    const password = config.env.dbPassword!;
    const keyName = config.env.keyName;
    
    const vpc = new ec2.Vpc(this, 'database-vpc-', {
      subnetConfiguration: [
        {
          cidrMask: 24,
          name: 'db-deploy-subnet',
          subnetType: ec2.SubnetType.PUBLIC
        }
      ]
    });
      
      const securityGroup = new ec2.SecurityGroup(this, 'db-deploy-instance-sg', {
          vpc: vpc,
          allowAllOutbound: true,
          securityGroupName: 'db-deploy-sg'
        }
      )
    
      securityGroup.addIngressRule(
        ec2.Peer.anyIpv4(),
        ec2.Port.tcp(22)
      )
      
      securityGroup.addIngressRule(
        ec2.Peer.anyIpv4(),
        ec2.Port.tcp(3306)
      )
    
    const databaseInstance = new DatabaseInstance(this, 'mysql-instance', {
      vpcSubnets: {
        onePerAz: true,
        subnetType: ec2.SubnetType.PUBLIC
      },
      instanceIdentifier: 'database-automation',
      securityGroups: [securityGroup],
      vpc: vpc,
      databaseName: 'DatabaseAutomation',
      allocatedStorage: 20,
      port: 3306,
      engine: DatabaseInstanceEngine.mysql({
        version: MysqlEngineVersion.VER_8_0
      }),
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.MICRO),
      credentials: Credentials.fromPassword(user, new SecretValue(password)),
      caCertificate: CaCertificate.RDS_CA_RDS2048_G1,
    });
    
    
    const role = new iam.Role(this, 'ec2-role', {
      assumedBy: new iam.ServicePrincipal('ec2.amazonaws.com'),
    });
    
   
    const instance = new ec2.Instance(this, 'db-deploy-instance', {
      vpc: vpc,
      role: role,
      securityGroup: securityGroup,
      vpcSubnets: {
        subnetType: ec2.SubnetType.PUBLIC
      },
      instanceName: 'db-deploy-instance',
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.MICRO),
      machineImage: ec2.MachineImage.genericLinux(
        {'us-east-1': 'ami-06aa3f7caf3a30282',
                'us-east-2': 'ami-05fb0b8c1424f266b'}),
      keyName: keyName
    });
    
    instance.addUserData(
      fs.readFileSync('lib/user-data.sh', 'utf-8')
    );
    
    databaseInstance.connections.allowFrom(instance, ec2.Port.tcp(3306));
    
    
    new cdk.aws_ssm.StringParameter(this, 'db-host-param', {
      parameterName: 'db-automation-mysql-host',
      stringValue: databaseInstance.dbInstanceEndpointAddress
    });
    
    new cdk.aws_ssm.StringParameter(this, 'db-port-param', {
      parameterName: 'db-automation-mysql-port',
      stringValue: '3306'
    });
    
    new cdk.aws_ssm.StringParameter(this, 'db-user-param', {
      parameterName: 'db-automation-mysql-user',
      stringValue: user
    });
    
    new cdk.aws_ssm.StringParameter(this, 'db-password-param', {
      parameterName: 'db-automation-mysql-password',
      stringValue: password
    });
    
    new cdk.CfnOutput(this, 'db-deploy-instance-output', {
      value: instance.instancePublicIp
    });
    
    new cdk.CfnOutput(this, 'db-deploy-database-endpoint-output', {
      value: databaseInstance.dbInstanceEndpointAddress
    });
    
  }
}
