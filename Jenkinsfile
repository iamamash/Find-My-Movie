pipeline {
  agent { label "dev" }
  stages {
    stage("Code") {
      steps {
        git url: "https://github.com/iamamash/Find-My-Movie.git", branch: "master"
      }
    }
    stage("Build and Test") {
      steps {
        sh "docker build . -t webapp"
      }
    }
    stage("Login and Push") {
      steps {
        withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"password",usernameVariable:"user")]) {
          sh "docker login -u ${env.user} -p ${env.password}"
          sh "docker tag webapp ${env.user}/find-my-movie:latest"
          sh "docker push ${env.user}/find-my-movie:latest"
        }
      }
    }
    stage("Deploy") {
      steps {
        sh "docker-compose down && docker-compose up -d"
      }
    }
  }
}
