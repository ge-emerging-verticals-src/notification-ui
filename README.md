# Notification Service Admin Panel

# An Overview:

The Notification Service Admin Panel offers a user interface to control and manage an instance of
CF3 Notification Service. Through the panel, you can view your tenant details and configure the webhooks for testing purposes, view event data to check the status of emails, manage and edit configurations, and send emails with or without a template.

## Getting Started

### Get the source code
Make a directory for your project.  Clone or download and extract the starter in that directory.
```
git clone https://github.build.ge.com/emerging-verticals/email-notification-ui.git  
cd email-notification-ui
```

### Install tools
If you don't have them already, you'll need node, bower and gulp to be installed globally on your machine.  

1. Install [node](https://nodejs.org/en/download/).  This includes npm - the node package manager.  
2. Install [bower](https://bower.io/) globally `npm install bower -g`  
3. Install [gulp](http://gulpjs.com/) globally `npm install gulp-cli -g`  

### Install the dependencies
Change directory into the new project you just cloned, then install dependencies.
```
npm install
bower install
```

## Running in Predix Cloud
With a few commands you can build a distribution version of the app, and deploy it to the cloud.

### Create a distribution version
Use gulp to create a distribution version of your app, which contains vulcanized files for more efficient serving.
You will need to run this command every time before you deploy to the Cloud.
```
gulp dist
```

## Push to the Cloud

### Pre-Requisites
Pushing (deploying) to a cloud environment requires knowledge of the commands involved and a valid user account with the environment.  GE uses Cloud Foundry for its cloud platform.  For information on Cloud Foundry, refer to this [link](http://docs.cloudfoundry.org/cf-cli/index.html).

### Steps
The simplest way to push the Starter application to a cloud environment is by modifying the default manifest file (manifest.yml) and using the **cf push** command, as follows:

1. Update manifest.yml

    Change the name field in your manifest.yml.  
    Uncomment the services section, and change the names to match your service instances.
    Uncomment the two base64ClientCredential environment variables and enter the correct values for your UAA clients.
    ```
    ---
    applications:
      - name: my-notification-ui
        memory: 64M
        buildpack: nodejs_buildpack
        command: node server/app.js
    #services:
     # - <your-name>-secure-uaa-instance
     # - <your-name>-notification-instance
    env:
        node_env: cloud
        uaa_service_label : predix-uaa
        # Add these values for authentication in the cloud
        #base64ClientCredential: dWFhLWNsaWVudC1pZDp1YWEtY2xpZW50LWlkLXNlY3JldA==
        #loginBase64ClientCredential: bG9naW5fY2xpZW50X2lkOnNlY3JldA==
    ```

2. Push to the cloud.

    ```
    cf push
    ```

3. Access the cloud deployment of your Starter application

  The output of the **cf push** command includes the URL to which your application was deployed.  Below is an example:

    ```
    Showing health and status for app my-notification-ui in org my-org / space dev as developer@gmail.com...
    OK

    requested state: started
    instances: 1/1
    usage: 128M x 1 instances
    urls: my-notification-ui.run.aws-usw02-pr.ice.predix.io
    last uploaded: Mon Apr 17 18:35:03 UTC 2017
    stack: cflinuxfs2
    buildpack: nodejs_buildpack

        state     since                    cpu    memory          disk          details
    #0   running   2017-04-17 11:35:40 AM   0.0%   63.5M of 128M   90.9M of 1G
    ```  

  Access your Starter application by adding "https://" to the beginning of the URL, and loading that URL in a web browser.


# Copyright
Copyright &copy; 2015, 2016, 2017 GE Global Research. All rights reserved.

The copyright to the computer software herein is the property of
GE Global Research. The software may be used and/or copied only
with the written permission of GE Global Research or in accordance
with the terms and conditions stipulated in the agreement/contract
under which the software has been supplied.
