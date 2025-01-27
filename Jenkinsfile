pipeline {
    agent any
    // {
    //     label "BuildAgent2"
    // }
    // environment {
    //     registry = "756519817970.dkr.ecr.us-east-2.amazonaws.com/postboard-server-repo"
    // }
    stages {
        // stage("Checkout") {
        //     steps {
        //         checkout scm
        //     }
        // }
        
        // stage("Code Coverage") {
        //     steps {
        //         jacoco()
        //     }
        // }
       
       
        // stage("Build & Upload") {
        //     steps {
        //         sh "npm install"
        
        //     }
        // }




        // stage ("Code Quality") {
        //     steps {
        //         withSonarQubeEnv("SonarQube") {
        //             sh "npm install sonar-scanner"
        //             sh "npm run sonar"
        //         }
        //     }
        // }   


// stage('Build and Push Docker Image') {
//     steps {
//         script {
//             sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 577638372446.dkr.ecr.us-east-2.amazonaws.com'

//             def imageTag = "build-${env.BUILD_NUMBER}"
//             def latestTag = "latest"

//             // Build the image
//             sh "docker build -t 577638372446.dkr.ecr.us-east-2.amazonaws.com/docker-images:${imageTag} ."
//             sh "docker tag 577638372446.dkr.ecr.us-east-2.amazonaws.com/docker-images:${imageTag} 577638372446.dkr.ecr.us-east-2.amazonaws.com/docker-images:${latestTag}"

//             // Push the image with both tags
//             sh "docker push 577638372446.dkr.ecr.us-east-2.amazonaws.com/docker-images:${imageTag}"
//             sh "docker push 577638372446.dkr.ecr.us-east-2.amazonaws.com/docker-images:${latestTag}"
//         }
//     }
// }

stage('Build and Push Docker Image') {
    steps {
        script {
            sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 577638372446.dkr.ecr.us-east-2.amazonaws.com'

            def buildTag = "build-${env.BUILD_NUMBER}"
            def latestTag = "build-${env.BUILD_NUMBER}-latest" // Dynamic 'latest' tag
            
            // Build the image with the Jenkins build number tag
            sh "docker build --no-cache -t 577638372446.dkr.ecr.us-east-2.amazonaws.com/node-react-repo:${buildTag} ."
            
            // Tag the image with the dynamic 'latest' tag (not overwriting 'latest')
            sh "docker tag 577638372446.dkr.ecr.us-east-2.amazonaws.com/node-react-repo:${buildTag} 577638372446.dkr.ecr.us-east-2.amazonaws.com/node-react-repo:${latestTag}"

            // Push both tags to ECR
            sh "docker push 577638372446.dkr.ecr.us-east-2.amazonaws.com/node-react-repo:${buildTag}"
            sh "docker push 577638372446.dkr.ecr.us-east-2.amazonaws.com/node-react-repo:${latestTag}"
        }
    }
}


// stage('Deploy Application') {
//     steps {
//         script {
//             // Trigger the deployment script on the target server
//             sshagent(['4867e2a4-980d-4950-ba51-c4ca1f763678']) {
//                 sh '''
//                 ssh -o StrictHostKeyChecking=no ec2-user@3.148.106.135 << 'EOF'
//                 cd /home/ec2-user/main/scripts
//                 chmod +x pull_and_deploy.sh
//                 ./pull_and_deploy.sh
//                 EOF
//                 '''
//             }
//         }
//     }
// }
stage('Deploy Application') {
    steps {
        script {
            // Trigger the deployment script on the target server
            sshagent(['4867e2a4-980d-4950-ba51-c4ca1f763678']) {
                sh '''
                ssh -o StrictHostKeyChecking=no ec2-user@3.148.106.135 <<EOF
                cd /home/ec2-user/main/scripts
                chmod +x pull_and_deploy.sh
                ./pull_and_deploy.sh
                EOF
                '''
            }
        }
    }
}
 
        // stage("Build & Upload") {
        //     steps {
        //         sh "npm install"
                // sh "npm start"
                
        //         sh "set +x && echo \"//ec2-3-145-203-189.us-east-2.compute.amazonaws.com:8081/repository/chiemela_devops_server_nexus_repo/:_authToken=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\" >> .npmrc"
        //         sh "npm publish"
        //   To publish without using puting the repo url in package.json do the line below

        //        sh 'npm publish --registry http://ec2-3-145-203-189.us-east-2.compute.amazonaws.com:8081/repository/chiemela_devops_server_nexus_repo/'

    // Put this in json file
    //      "publishConfig": {
    // "registry": "http://ec2-3-145-203-189.us-east-2.compute.amazonaws.com:8081/repository/chiemela_devops_server_nexus_repo/"
    // },

        
        //     }
        // }
       
//    stage("Build Docker Image") {
//             steps {
//                 script {
//                     // docker.build("cicd-server-application-image:${env.BUILD_ID}")
//                    sh 'docker build -t docker-images .'
//                 }
//             }
//         }

//  stage('Build Image and Pushing to ECR') {
//      steps{  
//          script {
//                 sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 577638372446.dkr.ecr.us-east-2.amazonaws.com'
//                 // sh 'docker build -t react-image .'
//                 sh 'docker build --no-cache -t react-image .'

//                 sh 'docker tag react-image:latest 577638372446.dkr.ecr.us-east-2.amazonaws.com/node-react-repo:latest'
//                 sh 'docker push 577638372446.dkr.ecr.us-east-2.amazonaws.com/node-react-repo:latest'
//          }
//         }
//       }
   

// 
        
        //     stage('Building image') {
    //   steps{
    //     script {
    //       dockerImage = docker.build registry
    //     }
    //   }
    // }
        
        //     stage ("terraform init") {
        //     steps {
        //         sh ("terraform init -reconfigure") 
        //     }
        // }
        
        // stage ("terraform plan") {
        //     steps {
        //         sh ('terraform plan') 
        //     }
        // }

        // stage ("terraform apply") {
        //     steps {
        //         echo "Terraform action is --> ${action}"
        //         sh ('terraform ${action} --auto-approve') 
        //   }
        // }
        
        
//         stage ('DEV Notify')  {
//             steps {

//       slackSend(channel:'jenkins-server', message: "Job is successful, here is the info -  Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
//   }
// }


//  stage ('DEV Approve')  {
//             steps {
//                echo "Taking approval from DEV Manager for QA Deployment"     
//             timeout(time: 7, unit: 'DAYS') {
//             input message: 'Do you approve QA Deployment?', submitter: 'admin'
//             }

// }
//    }


        
        
    //     stage('Building image') {
    //   steps{
    //     script {
    //       dockerImage = docker.build registry
    //     }
    //   }
    // }
    
    // stage('Pushing to ECR') {
    //  steps{  
    //      script {
    //             sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 756519817970.dkr.ecr.us-east-2.amazonaws.com'
    //             sh 'docker push 756519817970.dkr.ecr.us-east-2.amazonaws.com/postboard-server-repo:latest'
    //      }
    //     }
    //   }
   

    //  stage('stop previous containers') {
    //      steps {
    //         sh 'docker ps -f name=postboard-server-container -q | xargs --no-run-if-empty docker container stop'
    //         sh 'docker container ls -a -fname=postboard-server-container -q | xargs -r docker container rm'
    //      }
    //     }
        
        

// stage('Docker Run') {
//      steps{
//          script {
//                 sh 'docker run -d -p 8091:4000 --rm --name postboard-server-container 756519817970.dkr.ecr.us-east-2.amazonaws.com/postboard-server-repo:latest'
//             }
//       }
//     }



        
    }
}
