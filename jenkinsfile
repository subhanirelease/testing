pipeline {
    environment {
        EMAIL_TO = 'admin-team@releaseiq.io,devops-team@releaseiq.io'
        module="enterprise-management"
        git_tag="${env.JOB_NAME}-${env.BUILD_NUMBER}"
        GIT_AUTH = credentials('bitbucket')
    }
    
   agent {
       kubernetes {
      //cloud 'kubernetes'
      yaml """
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug-539ddefcae3fd6b411a95982a830d987f4214251
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
    volumeMounts:
      - name: docker-config
        mountPath: /kaniko/.docker
  - name: helm
    image: docker.io/alpine/helm:latest
    imagePullPolicy: IfNotPresent
    command:
    -  cat
    tty: true
  - name: nodejs
    image: docker.io/timbru31/java-node:latest
    imagePullPolicy: IfNotPresent
    command:
    -  cat
    tty: true
  - name: awscli
    image: docker.io/mesosphere/aws-cli:latest
    imagePullPolicy: IfNotPresent
    command:
    -  cat
    tty: true
  volumes:
    - name: docker-config
      configMap:
        name: docker-config
"""
  }
   }
   stages {
       
      stage('Checkout') {
         steps {
           checkout([$class: 'GitSCM', branches: [[name: '*/dev']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'bitbucket', url: 'https://kaspr001@bitbucket.org/riqio/riq-admin-backend.git']]])
          //checkout([$class: 'GitSCM', branches: [[name: '9972e1d7ac993d505dd6ff1908b037573ef6c5ea']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'bitbucket', url: 'https://kaspr001@bitbucket.org/riqio/riq-admin-backend.git']]])
         }
      }
      
      stage('Compile') {
          steps {
              //sh './gradlew build'
              sh './gradlew clean build'
          }
      }
    stage('Unit Test Report') {
        steps {
            junit keepLongStdio: true, testResults: 'build/test-results/test/*.xml'
        }
    }
  stage('Build Docker Image & Publish') {
      steps {
        //git 'https://github.com/prabhatsharma/sample-microservice'
        container(name: 'kaniko') {
            sh '''
            /kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=641518622681.dkr.ecr.us-west-2.amazonaws.com/riq-admin-backend:latest --destination=641518622681.dkr.ecr.us-west-2.amazonaws.com/riq-admin-backend:$BUILD_NUMBER
            '''
        }
      }
    }
  stage('Deploy to k8s cluster') {
  steps{
    container(name: 'helm') {
     echo 'Updating Service'
     sh 'echo build no is $BUILD_NUMBER'
     sh '''pwd
     cd $WORKSPACE/deployment/helm/$module
     ls -l
     sed -i "s/version: 0.1.0/version: 0.1.$BUILD_NUMBER/g" Chart.yaml
     cat Chart.yaml
     helm version
     helm upgrade --install --namespace $ENV_NAME --values $ENV_NAME.yaml --debug --force --set image.tag=$BUILD_NUMBER admin-bev1 .
     '''
    //  helm upgrade --install --namespace staging --debug --force --set image.tag=$BUILD_NUMBER admin-bev1 .
        }
      }
    }
     stage('git tagging') {
        steps {
            sh '''
                git config --local credential.helper "!f() { echo username=\\$GIT_AUTH_USR; echo password=\\$GIT_AUTH_PSW; }; f"
                git tag $git_tag
                git push origin $git_tag
            '''
        }
    }
  }
     post {  
          success {  
              echo "${env.JOB_NAME} Build & Deploy successful"
             echo "$EMAIL_TO"
              mail bcc: '', body: "<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> Build URL: ${env.BUILD_URL}console", cc: '', charset: 'UTF-8', from: 'devops', mimeType: 'text/html', replyTo: '', subject: "Build Success: Project name -> ${env.JOB_NAME}", to: "$EMAIL_TO";  
          }  
          failure {
              echo "${env.JOB_NAME} Build & Deploy failed"
              mail bcc: '', body: "<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> Build URL: ${env.BUILD_URL}console", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "Build Failed: Project name -> ${env.JOB_NAME}", to: "$EMAIL_TO}";  
          }  
      }
     
}
