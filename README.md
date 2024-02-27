# νFit / NuFit

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-%23FF6F00.svg?style=for-the-badge&logo=TensorFlow&logoColor=white)](https://www.tensorflow.org/learn#build-models)
[![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com/)
[![Google Cloud](https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/)

<p align="center">
  <img src="https://github.com/qu-ngx/NuFit/assets/91497379/091e364a-cf58-428f-8cd8-e704edcb187f" alt="drawing" width="300" height="300"/>
</p>


> NuFit is an application developed by a group of four students from the Google Developer Student Club - DePauw University Chapter. Our app aims to create nutritious and healthy meal plans for anyone who is on a diet by using AI Camera technology to inform on different types of food, helping organize their healthy meals, and providing information through fun quizzes.

**Watch NuFit demo video here: [NuFit - GDSC Solution Challenge 2024](https://youtu.be/tX5rReaz9Qc)**

## Our user survey

+ By the time we completed the project, we have surveyed 102 different people in our application's launching survey.
+ The survey shows that 87.3% of all the surveyed groups like and think that our ideas are applicable as a solution to the problems we are challenging ourselves to. At the same time, 75.5% of the surveyed users found that our application is practical to our goals and that we could solve our UN Problems.

<p align="center">
  <img src="https://github.com/qu-ngx/NuFit/assets/91497379/e0038e75-78ef-4d74-8b01-e59cba18cd57" alt="drawing" width="500" height="278"/>
  <img src="https://github.com/qu-ngx/NuFit/assets/91497379/ff1f3a83-a210-4460-8046-3d9f1da3ad6a" alt="drawing" width="500" height="278"/>
  <img src="https://github.com/qu-ngx/NuFit/assets/91497379/21314c27-d334-43a3-a295-a8d4a935c407" alt="drawing" width="500" height="278"/>
</p>

## Application features

**LogIn/Register/LogOut Screens:**
+ Firebase Authentication was used for login/logout/register screens and easy Google login screen. 
<p align="center">
  <img src="https://github.com/qu-ngx/NuFit/assets/91497379/ead38b8c-8ae9-4165-adce-d9eb222e54ed" alt="drawing" width="500" height="278"/>
</p>

<p align="center">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/7ab4de4a-4410-4b0a-b4e6-a4b279d82c3b">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/7ad23228-0de8-4480-bcd9-2feeb0aef0c1">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/5216d51e-ef66-458d-a0ef-0a21be85f1ec">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/ed2f785a-7b8a-42f3-a922-cb1af5f39757">
</p>


**Quiz contents and Quiz Page:**
+ Firebase Storage was implemented for quiz page and its contents:
<p align="center">
  <img src="https://github.com/qu-ngx/NuFit/assets/91497379/79fbc7da-4e49-41a2-b8a1-51690ff923a2" alt="drawing" width="500" height="278"/>
</p>
<p align="center">
<img width="299" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/32b89577-2e87-4374-af4f-c2dd563ec4ea">
<img width="308" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/b92c9d25-f39f-436b-9df8-d163351d367f">
</p>


**Machine Learning (Tensorflow):**
+ This feature was implemented for AI Food Camera:
<p align="center">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/703fe187-0a5b-4258-97c4-42c96edbe01e">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/00af8b48-3f51-4548-9cf5-a84eeadfc9da">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/bc1b905c-8d0d-402f-acf7-10e935ac26a1">
<img width="169" alt="image" src="https://github.com/qu-ngx/NuFit/assets/91497379/4cd01adf-05fc-4409-916a-67fbfcbd59ab">
</p>

## Project structure module

Project compose 2 repositories:
1. Full-stack Mobile Application: [current repository](./)
2. Backend AI Model: [Food Detection API](https://github.com/qu-ngx/nufit-ml.git)

<hr />


## Mobile Installation

 **  Coming soon  ** 

## Local Installation

**Requirements**:

- Flutter: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
- Dart: [https://dart.dev/get-dart](https://dart.dev/get-dart)
- Android Studio: [https://developer.android.com/studio](https://developer.android.com/studio)
- Xcode: [https://developer.apple.com/xcode/](https://developer.apple.com/xcode/)
- Run on your physical device with the instruction [here](https://flutter.dev/docs/get-started/install/macos#set-up-the-ios-device) (for iOS) and [here](https://flutter.dev/docs/get-started/install/windows#set-up-the-android-device) (for Android).

**Steps**:

- Clone project to local machine:

```bash
git clone https://github.com/qu-ngx/NuFit.git
```

- Open your terminal and run the following commands:

```bash
cd NuFit
```

- Run the following commands to install all dependencies:

```bash
flutter pub get
```

- Run the following commands to run the project:

```bash
flutter run
```

- Run the following commands in production mode:

```bash
flutter run --release
```

**Note**: If you encounter some problems with installation, you should:

- Check your internet connection (For Authentication & packages installation);
- Run `flutter clean` and `flutter run`;
- Delete `graddle-wrapper.jar` file from `android/gradle/wrapper/gradlle-wrapper.jar` and `flutter run`.

