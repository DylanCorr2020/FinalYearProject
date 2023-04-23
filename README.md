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
Flutter/Dart, Google Cloud Firestore, Stripe and Google DialogFlow.

# Flutter/Dart
1. Follow the steps in the following link to install Flutter , Android Studio and start up Android Studio Emulator. Click [here](https://docs.flutter.dev/get-started/install)
2. Follow the steps in the following link to install Visual Studio code with flutter extensions. Click [here](https://docs.flutter.dev/development/tools/vs-code).
3. Run command to verify if flutter was installed correctly.
Follow instructions. If there are errors, follow instructions to correct them.
```
flutter doctor
```

Run the following command to clone the repository down to your local machine
```
git clone https://github.com/DylanCorr2020/FinalYearProject.git
```

# Integration with Firebase 
Follow the steps to in the following video to set up Firebase with Flutter.Click [here](https://www.youtube.com/watch?v=Wa0rdbb53I8&t=329s)

1. Create a Firebase account. 
2. Create a Firebase project and give it a name.
3. Set up a new Android app for the backend. Use your application Id as the package name. Download google services.json file and overwrite the one thats there.
4. Important: There is no need to perform the steps to add the firebase SDK because this is already configured. All the firebase plugins have already been added and configured.
5. Click continue to complete the set up.


# Set up Firebase Project with Firebase Authentication
1. In the firebase console click on Authentication left hand side menu.
2. Click on sign in method.
3. Enable email and password and save.


# Enable Firestore Database and Populate with Product Images and Collections.
1. Enable Firestore database. 
2. Enable Firebase storage.
3. Load up product images into firebase storage.
4. Create product collection in the firestore database.(id:string,name:string,category:string,price:string,description:string,image:string containig link to image in firebase storage)



# Integration with Stripe
Create a stripe account using the following link. Click [here](https://stripe.com/en-ie).
Make sure test mode is enabled.
Click on Developers and click on API keys.
Make note of your publishable key and your secret key. 


## Deploy the cloud function
Watch this video getting started with cloud functions. Click [here](https://www.youtube.com/watch?v=DYfP-UIKxH0&list=PLl-K7zZEsYLkPZHe41m4jfAxUi0JjLgSM&index=2).
Deploy the cloud function to your firebase database.

Here the steps:
1. Install Node.js click [here](https://nodejs.org/en/download)
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
   Select the firebase project you created earlier. This is where you want to put the firebase function. 
7. Set your stripe private key which you got from your stripe account using the following command 
   ```
       firebase functions:config:set stripe.test key=""
   ``` 
8. Deploy your firebase function using the following command 
    ```
    firebase deploy
    ``` 
9. Record the address of the firebase function that was deployed. The link is displayed as part of the firebase deploy command.

##  Configure the flutter project 
  1. Open the project in Visual Studio Code.

  2. Edit the paymentsController.dart put in the address of the firebase function.
    ```
     //string to cloud function
     //put in the address of the firebase function
     String url = "address of the firebase function"; 
    ```
  3. Add your stripe public key to the following code in the paymentsController.dart
     ```
     publishableKey: "enter stripe public key here"
     ```
  4. Rebuild and run the flutter app.

# Setting Up DialogFlow 
Follow the steps to set up your own Dialog flow. Click [here](https://www.youtube.com/watch?v=GC6VAWi1n14)

## Setting Up DialogFlow Account
Create a Dialogflow account.

## Create an Agent
 Create an agent and give a name to agent. This will create a   google project automatically with project id.

## Download API key from Google Cloud.
1. Go to google console and find the project. 
2. Click on API and Services, click on credentials.
3. Click on create credentials and click on service account.
4. Give name to service account. 
5. Select a role, Dialog Flow API Admin and click on create and continue. 
6. Get API key, click on service account and click on keys. 
7. Click on create new key in JSON format.
8. The JSON file is downloaded. 

## Create Intents 
 Follow the steps in the video to create intents for the app.


## Replace JSON file
1. Replace the JSON file in assets folder with your JSON file.
2. Rebuild program and run it. 







