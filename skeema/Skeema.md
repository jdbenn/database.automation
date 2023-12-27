### [Skeema](https://skeema.io)

Skeema is a state based database management tool for MySql databases.  You define the state you want your database to be in
through a series of create statements that represent your database objects; the tool then compares your model state to the 
target database state and applies the changes.

This approach works well for source control and situations where the database can be destroyed and re-created
(such as early development).

The problem with this type of approach is that it takes a brute force approach to migrating - regardless of data loss or not.  

![hulk smash](https://preview.redd.it/is-there-any-hulk-figure-that-can-do-the-classic-hulk-smash-v0-p8ix9i8wa5na1.jpg?auto=webp&s=202fa2e54cab55276f04ee0a6ff709687dcff56e)



### Local Development Set-up

There are 3 versions of the skeema cli available.  

- community
- plus
- max

Unfortunately the community (free) version is only supported on Linux and MacOS machines.  You would need to purchase
Plus or Max to get access to the Windows build.  

The community version also does not support views, triggers or seeding data.  

For the purpose of this demonstration the community edition will serve what we need to demonstrate.

We are going to use Docker to get around the platform limitations.  

##### Docker

The way we can get around the limitation of Linux or Mac for the community edition is to build our own docker image with the 
skeema cli installed.  

We can use the bind mount feature of docker to bind a host directory to a directory running in the container. 

![bind mount](docs/images/bind-mount.png)

What we will do is maintain our database definition in the [schemas](../skeema/schemas) directory which is then used as a bind
mount in the running container.  

*NOTE* : Mac users with an M1 / M2 chip - we have to use the arm64 architecture.  A separate [docker-compose](../mysql/mac/docker-compose.yml)
and [dockerfile](../mysql/mac/dockerfile) has been provided.  

Our first step is to define a [dockerfile](../mysql/dockerfile) which will contain the mysql instance and the skeema cli.

```dockerfile
FROM ubuntu/mysql
RUN apt-get update
RUN apt-get -y install curl
RUN curl -LO https://github.com/skeema/skeema/releases/latest/download/skeema_amd64.deb
RUN apt install ./skeema_amd64.deb
```

Not a lot of magic here.  Our image is based on the ubuntu/mysql image.  We then use the same instructions we used 
to install the skeema cli on our bastion host

To make our lives a bit easier, we use [Docker Compose](../mysql/mac/docker-compose.yml) to stand up and tear down the container.  

```yaml
version: '3.3'

services:

  db:
    container_name: mysql
    build: .
    ports:
      - '3306:3306'
    environment:
      MYSQL_ROOT_PASSWORD: password
    volumes:
      - ../skeema/schemas:/var/schemas

```

Docker compose will build an image called "skeema-db".  A bind volume mount is declared binding the [schemas](schemas) 
directory to the /var/schemas directory of the container. 

Start the container.

```shell
docker-compose up -d
```

Then check the container status

```shell
docker container ls
```

![docker-container](docs/images/docker-compose.png)

Run a shell script against the container. 

```shell
docker exec -it mysql sh
```

At the bash prompt - login to the local MySql instance:

```shell
mysql -h localhost -r user -ppassword
```

![local-no-db](docs/images/local-mysql.png)

List the databases.

```shell
mysql>show databases;
```

![empty instance](docs/images/empty.png)

##### Adventure Works

I found a MySql version of the time honored [Adventure Works](schemas/AdventureWorks) database.  So we are going to deploy 
a fresh copy of the Adventure Works schema to our running mysql container. Before we go into the commands in the script, 
I want to briefly describe how the skeema cli works.  

The first thing to point out is the configuration file [.skeema](schemas/.skeema).

```text
generator=skeema:1.11.0-community

[deploy]
flavor=mysql:8.0
host=#{DB_HOST}#
password=#{DB_PASSWORD}#
port=#{DB_PORT}#
user=#{DB_USER}#

[local]
flavor=mysql:8.0
host=localhost
password=password
port=3306
user=root
```

This file defines 2 profiles:  deploy and local.  

For now we focus on the local profile.  The configuration is pretty obvious.  It defines the version of mysql, the host, 
credentials and the port that the skeema cli will use to access the database. 

The commands we are interested in are the [diff](https://www.skeema.io/docs/commands/diff/) and [push](https://www.skeema.io/docs/commands/push/) commands.

The diff command does exactly what it sounds like - it captures the diff between the model and the instance.

Once again run an interactive shell against the mysql container:

```shell
docker exec -it mysql sh
```

Once you have a shell container running, change directories to the container bind mound directory: 

```shell
cd /var/schemas
```

Run the diff command for the local profile:

```shell
skeema diff local
```
![diff](docs/images/diff.png)

Every difference between the model and instance are identified. 

Push the changes to the instance.  

```shell
skeema push local --allow-unsafe
```

Connect to the database - let's confirm the deployment.

```shell
mysql -h localhost -u root -ppassword
```

List the databases:

```shell
mysql>show databases;
```

![](docs/images/show-1.png)

Finally, list the tables in the AdventureWorks database:

```shell
mysql>show tables in AdventureWorks;
```
![](docs/images/aw-tables-1.png)

Logging in to the container and running the diff and update commands is tedious.  So I have provided a few helper scripts. 

[update-database.sh](update-database.sh) / [update-database.ps1](update-database.ps1) and [skeema.sh](skeema.sh).

Now all we need to do to apply changes is:


```shell
sh update-databash.sh
```

or 

```powershell
PS /users/johnbennett>update-database.ps1
```

After running this we se no differences:

```text
(base) johnbennett@Johns-MacBook-Pro skeema % sh update-database.sh 
2023-12-25 23:11:04 [INFO]  Generating diff of localhost:3306 AdventureWorks vs /var/schemas/AdventureWorks/*.sql
2023-12-25 23:11:04 [INFO]  localhost:3306 AdventureWorks: No differences found
2023-12-25 23:11:04 [INFO]  Pushing changes from /var/schemas/AdventureWorks/*.sql to localhost:3306 AdventureWorks
2023-12-25 23:11:04 [INFO]  localhost:3306 AdventureWorks: No differences found
```

##### Getting Updates from Source and Applying

I have applied a change to the model - adding a "TestTable" to the schema - from a different machine.  In typical workflow we 
will pull the latest from source and create a new branch to work with.  

After pulling the latest code from source control, there is now a table called [testtable.sql](schemas/AdventureWorks/testtable.sql)
in the AdventureWorks schema.

All we need to do is update our local database:

```bash
sh update-database.sh
```

or 

```powershell
PS /Users/johnbennett>update-database.ps1
```

Login to the container again and connect to the database:

```shell
docker exec -it mysql bash
mysql -h localhost -u root -ppassword
mysql>show tables in AdventureWorks;
```

```text
| Sales_ShoppingCartItem                           |
| Sales_SpecialOffer                               |
| Sales_SpecialOfferProduct                        |
| Sales_Store                                      |
| TestTable                                        |
| dbo_AWBuildVersion                               |
| dbo_DatabaseLog                                  |
| dbo_ErrorLog                                     |
+--------------------------------------------------+
72 rows in set (0.00 sec)

mysql> 
```

So we have seen how to put a MySql database under source control using a state based approach.  We are able to define tables 
and other MySql objects, commit them and update local copies of the database.  

In a real world scenario database changes would like be a dependency for application code changes.  Having our database 
code changes live with the same commit as our application code changes ensures we have the corresponding database requirements 
in place prior to running the application (data excluded).

This only solves the development problem.  We now need to get these changes deployed to the working environment.  

[Home](../ReadMe.md)

### CI/CD Set-Up

**STOP** : If you have not done so already - make sure you configure the bastion host as a [Github Runner](../.github/Runner.md) before proceeding.

Our first step is to define our [Github workflow file](../.github/workflows/pipeline.yaml).

If you are not familiar with Github actions, here is a brief explanation of the workflow:

1. Code that is checked into Github can trigger actions by defining one or more workflow files located in a directory called
".github/workflows".  This is a convention that Github chooses and makes it really easy to add / modify pipelines.  
2. Starting from the top of the file:

```yaml
name: deploy

on:
  push:
    branches:
      - main
permissions:
  id-token: write
  contents: read
  actions: read
```
This workflow is named deploy and will trigger on push to the main branch (i.e. completing a pull request).  The permissions 
are declarative in that we are giving the workflow to read and write actions as well as obtain a token for packages.

3. All workflows have to have at least 1 job (something run on a runner).  We have defined only one job:

```yaml
jobs:
  deployDev:
    name: Deploy Dev
    runs-on: self-hosted
    environment: dev
```

Self-explanatory - this job is called "deployDev" and runs on a self-hosted runner.

4. Jobs have "steps" to perform.  The first few steps:

```yaml
    steps:
      - name: 'Cleanup build folder'
        run: |
          ls -la ./
          rm -rf ./* || true
          rm -rf ./.??* || true
          ls -la ./
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Set Node
        uses: actions/setup-node@v4
        with:
          node-version: 18.x
      - name: Install
        uses: borales/actions-yarn@v4
        with:
          cmd: install
```

Github actions lack "clean build folders" action - so this first step does just that.  The next 3 steps checkout the commit
from source control, set the node version and install dependencies with yarn.

5. Now we get into the specifics for our database deployment.  The first thing we need is the datbase connection information.  
Recall the secrets and parameters we defined in the [stack](../stack/lib/stack.ts).  We also defined a role and EC2 instance
profile.  This role was given permissions to the secrets and parameters.  Since our bastion host (aka our Github Runner) has
an instance profile using that role - the runner has permissions to those resources.  We do not need to provide separate
credentials to access them:

```typescript
const hostParam =new cdk.aws_ssm.StringParameter(this, 'db-host-param', {
  parameterName: 'db-automation-mysql-host',
  stringValue: databaseInstance.dbInstanceEndpointAddress
});

const portParam = new cdk.aws_ssm.StringParameter(this, 'db-port-param', {
  parameterName: 'db-automation-mysql-port',
  stringValue: '3306'
});

const userSecret = new Secret(this, 'db-user-secret', {
  secretName: 'db-automation-mysql-user',
  secretStringValue: SecretValue.unsafePlainText(user)
});

const passwordSecret = new Secret(this, 'db-password-secret', {
  secretName: 'db-automation-mysql-password',
  secretStringValue: SecretValue.unsafePlainText(password)
});

hostParam.grantRead(role);
portParam.grantRead(role);
userSecret.grantRead(role);
passwordSecret.grantRead(role);
```

```yaml
      - name: Set Database Credentials
        run: |
          echo DB_HOST=`aws ssm get-parameter --name db-automation-mysql-host --query "Parameter.Value" --output text` >> $GITHUB_ENV
          echo DB_PORT=`aws ssm get-parameter --name db-automation-mysql-port --query "Parameter.Value" --output text` >> $GITHUB_ENV
          echo DB_USER=`aws secretsmanager get-secret-value --secret-id db-automation-mysql-user --query "SecretString" --output text` >> $GITHUB_ENV
          echo DB_PASSWORD=`aws secretsmanager get-secret-value --secret-id db-automation-mysql-password --query "SecretString" --output text` >> $GITHUB_ENV
```

All we are doing here is retrieving the connection endpoint, port, user and password from AWS Systems Manager and Secrets 
Manager respectively.

Take note of the variables we assign them to and notice 

```text
>> $GITHUB_ENV
```

at the end of each script.  What this does is assign the parameter / secret value to the variable and export that variable 
as an environment variable.  

This is an important detail for the next step.

6. The next step replaces tokens in the [.skeema](schemas/.skeema) file under the "deploy" profile:

```yaml
      - name: Replace Tokens in .skeema config
        uses: cschleiden/replace-tokens@v1
        with:
          files: './skeema/schemas/.skeema'
```

```text
generator=skeema:1.11.0-community

[deploy]
flavor=mysql:8.0
host=#{DB_HOST}#
password=#{DB_PASSWORD}#
port=#{DB_PORT}#
user=#{DB_USER}#

[local]
flavor=mysql:8.0
host=localhost
password=password
port=3306
user=root

```

Note how the environment variables names in step 5 match the tokens in the file.  

7.  Finally, we deploy the database changes:

```yaml
      - name: deploy db
        run: |
          skeema push deploy --allow-unsafe
        working-directory: ./skeema/schemas
```
