# Cloud Network Environment Technology 4 Application for Administration

## What is CloudNet-App?
**Coming soon**

###### **CloudNet v4-App** is the next generation of Administrating your cloud system

## Features
- **Dark/Light mode**
- Modern Programming Language
- Full implemented RestAPI from CloudNet
- Live Console of each node*
- Accessibility UI Design for easy handling of your cloud*
- Manipulation of module configs*
- Update of node configs*
- **Direct communicated with CloudNet Developers** (Special Thanks to [derklaro](https://github.com/derklaro) and [0utplay](https://github.com/0utplay))
- Active cluster management*
- Player management*
- Manipulation of database entries*
- Easy setup routine for tasks and templates
- **Integration of Cloud Permission System**
- Management of Templates and Files*
- Integrated Text Editor*

\* coming soon; not implemented yet


## Setup
Go to [CloudNet-v3](https://github.com/CloudNetService/CloudNet-v3) repo.
Go to actions tab and select the latest actions with the branch `unstable/rewrite` and download the zip file.
Unzip the zip file into a folder and run the launcher.jar.
After the stop with CTRL + C edit the `launcher.cnl` and change the line
`var cloudnet.updateBranch release` into `var cloudnet.updateBranch unstable/rewrite`.
Start again the cloud and install the rest module over `module install CloudNet-Rest` 


## Start to develop
### Prerequisites
- Git
- Flutter
- Android Studio
- CloudNet v4 Node
### How to use
Clone the repo into your [Android Studio](https://developer.android.com/studio).
Run at every change at [freezed](https://pub.dev/packages/freezed) model this command:
```shell
flutter pub run build_runner build
```
Then to the top bar beside the debugging button and press `Edit configuration`.
Add new flutter configuration and use as dart main following file: `main_alpha.dart`. 
And add also at `Build Flavor` `alpha` as value. 
