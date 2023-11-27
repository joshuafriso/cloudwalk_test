# cloudwalk_test

# Project Description
This is a Nasa's Astronomy Picture of the Day app

# Table of Contents

* [Getting Started](#getting-started)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Usage](#usage)
* [Folder Structure](#folde-structure)
* [Running Tests Locally](#running-tests-locally)

# Getting Started
These instructions will get you a copy of the project up and running on your local machine for development purposes.

## Prerequisites
To run this project, you need to have the following installed on your machine:
1. Flutter (https://docs.flutter.dev/get-started/install)
2. Dart SDK (https://dart.dev/tools/sdk)
3. Android Studio
4. VS Code
5. JDK 8+ for android development
6. Gradle for android build tools
7. Derry (https://pub.dev/packages/derry)

## Installation
Clone or download this repository and open it in an IDE like Android Studio or Visual Studio Code. Make sure that all dependencies are properly set up before.<br>
Then execute the following commands in order:<br>
flutter pub get<br>
After all the dependencies were got, press F5 to run the project<br>
If you want to generate an apk use the command: derry build_apk

# Usage
The Home page contains an AppBar that has a connectivity indicator and a title, under the AppBar is a SearchBar where you can search by Title or Date, if search by date pay attention to the format that needs to be typed, for example: '2023-11-22',
the page has a scroll and returns the last 30 days of images.<br>
For details about some images just tap in what you want more information and the app will redirect you to the Details Page.<br>
The Details Page contains an AppBar that has a connectivity indicator, a title and a back button, the image or video, the title, the date, and an explanation about the picture of the day.

# Folder Structure
lib<br>
|   |_app<br>
|   |   |_config<br>
|   |  |_modules<br>
|   |   |       |_details<br>
|   |   |       |       |_widgets<br>
|   |   |       |_home<br>
|   |   |       |       |_interfaces<br>
|   |   |       |       |_repositories<br>
|   |   |       |       |_services<br>
|   |   |       |       |_widgets<br>
|   |   |_shared<br>
|   |   |       |_models<br>
|   |   |       |_utils<br>
|   |   |       |_widgets<br>
|   |   |       |       |_connectivity_status<br>
|   |_main.dart<br>
|_test<br>
|   |_app<br>
|   |   |_modules<br>
|   |   |  |_details<br>
|   |   |  |_home<br>
|   |   |  |    |_repositories<br>
|   |   |_shared<br>
|   |   |   |_widgets<br>
|   |   |   |   |_connectivity_status<br>

# Running Tests Locally
To run tests locally, open the terminal or command prompt navigate to the root directory of the app folder then type flutter test. This will start running all the tests
