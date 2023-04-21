# Applied Project and Minor Dissertation Project 2023

This is a mobile food delivery application written in Flutter. This repository contains the source code as well as all related materials for the project. The application was developed on the windows platform.


---

| **Project Title**       | Food Application                                         |
| :---------------------- | :------------------------------------------------------- |
| **Course**              | BSc (Hons) in Software Development                       |
| **Module**              | Applied Project and Minor Dissertation                   |
| **Institute**           | [Atlantic Technological University](https://www.atu.ie/) |
| **Student**             | Dylan Corr                                               |
| **Project Supervisors** | Daniel Cregg                                             |
| **Module Supervisor**   | Dr. John Healy                                           |

---

# Introduction
This project requires the following technologies
Flutter/Dart
Integration with Google Firebase
Integration with Stripe
Integration with Google DialogFlow 

# Flutter/Dart
Follow the steps in the following link to install Flutter , Android Studio and start up Android Studio Emulator. Click [here](https://docs.flutter.dev/get-started/install)
Follow the steps in the following link to install Visual Studio code with flutter exstensions. Click [here](https://docs.flutter.dev/development/tools/vs-code).
Run this command to verify if flutter was installed correctly.
Follow instructions that it provides.
```
flutter doctor
```

Run the following command to clone the repository down to your local machine
```
git clone https://github.com/DylanCorr2020/FinalYearProject.git
```

# Integration with Firebase 
Follow the steps to in the following video.Click [here](https://www.youtube.com/watch?v=Wa0rdbb53I8&t=329s)

# Integration with Stripe
Create a stripe account using the following link. Click [here](https://stripe.com/en-ie)
Make sure test mode is enabled.
Click on Developers and click on API keys.
Make note of your publishable key and your secret key. 


## Deploy the cloud function
Watch this video getting started with cloud functions. Click [here](https://www.youtube.com/watch?v=DYfP-UIKxH0&list=PLl-K7zZEsYLkPZHe41m4jfAxUi0JjLgSM&index=2)
Deploy the cloud function to your firebase database.

Here the steps:
1. Install Node.js click here
2. Get the latest version of node.
3. Install Firebase CLI
   ```
   npm install -g firebase-tools
   ```
4. Navigate to the firebaseFunction folder in the command line.
5. Change directory into this folder. 
6. Run this command 
   ```
    firebase login
   ``` 
7. Select the firebase project where you want to put your firebase function. 
8. Set your stripe private key using the following command 
   ```
       firebase functions:config:set stripe.test key=""
   ``` 
8. Deploy your firebase function using the following command 
    ```
    firebase deploy
    ``` 
9. Record the address of the firebase function that was deployed. 

##  Configure the flutter project 
  1.  Edit the paymentsController.dart
    ```
     //string to cloud function
     //put in the address of the firebase function
     String url = ""; 
    ```
  2. Add your stripe public key to the following code in the paymentsController.dart
     ```
     publishableKey: ""
     ```

## Setting Up DialogFlow




Install Android Studio [here](https://developer.android.com/studio?gclid=CjwKCAjwiOCgBhAgEiwAjv5whFKiuYJtd_MgzZ_hon0WUILpXWpUlqK13_zlc2UW21Qo513Gt0VD3xoC38UQAvD_BwE&gclsrc=aw.ds)

Install Visual Studio Code [here](https://code.visualstudio.com/download)
