### Intro


### Motivation


### Objectives

### Overview

We are going to deploy a stack to AWS that allows us to simulate a real world environment.  Our stack consists of a VPC, 
subnets, an EC2 that will act as a bastion host / application host / deployment job runner, an RDS database and finally 
some secrets and systems manager parameter to store our database connection information. 

![](docs/images/aws-stack.png)

The EC2 instance is deployed to a public subnet (allowing us to connect to the server).  The RDS instance is deployed into 
a private isolated subnet.  We add a security group with a rule to allow for communication between the EC2 instance and
the RDS instance.  

Our EC2 instance will also service as a bastion host and Github Action runner.  We will be able to run mysql client commands
via the commandline as well as deploy our database changes because of the security group and network configuration we set-up in the 
stack.  

### Sections

I will be adding more sections over time.  The stack deployment will also be modified over time (adding in additional resources).  

Our starting point will be with the stack deployment.  Once the stack is deployed and verified, the next sections go into 
detail on different tools and techniques for database deployment.  

1. [Stack Deployment](stack/Stack-Deployment.md)
2. [Github Runner](.github/Runner.md)
3. [Skeema](skeema/Skeema.md)
