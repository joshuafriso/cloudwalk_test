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

## Installation
Clone or download this repository and open it in an IDE like Android Studio or Visual Studio Code. Make sure that all dependencies are properly set up before.
Then execute the following commands in order:
flutter pub get
After all the dependencies were got, press F5 to run the project

# Usage
The Home page contains an AppBar that has a connectivity indicator and a title, under the AppBar is a SearchBar where you can search by Title or Date, if search by date pay attention to the format that needs to be typed, for example: '2023-11-22',
the page has a scroll and returns the last 30 days of images.
For details about some images just tap in what you want more information and the app will redirect you to the Details Page.
The Details Page contains an AppBar that has a connectivity indicator, a title and a back button, the image or video, the title, the date, and an explanation about the picture of the day.

# Folder Structure
lib
|   |_app
|   |   |_config
|   |  |_modules
|   |   |       |_details
|   |   |       |       |_widgets
|   |   |       |_home
|   |   |       |       |_interfaces
|   |   |       |       |_repositories
|   |   |       |       |_services
|   |   |       |       |_widgets
|   |   |_shared
|   |   |       |_models
|   |   |       |_utils
|   |   |       |_widgets
|   |   |       |       |_connectivity_status
|   |_main.dart
|_test
|   |_app
|   |   |_modules
|   |   |  |_details
|   |   |  |_home
|   |   |  |    |_repositories
|   |   |_shared
|   |   |   |_widgets
|   |   |   |   |_connectivity_status

# Running Tests Locally
To run tests locally, open the terminal or command prompt navigate to the root directory of the app folder then type flutter test. This will start running all the tests
