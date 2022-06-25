# Cloud Network Environment Technology 4 Application for Administration

## What is CloudNet-App?
**Coming soon**

###### **CloudNet v4-App** is the next generation of cloud system administration

## Features
- **Dark/Light mode**
- Modern programming language
- Fully implemented RestAPI from CloudNet
- Live console of each node*
- Accessible User Interface Design for easy handling of your cloud*
- Manipulation of module configs*
- Update of node configs*
- **Direct communication with CloudNet developers** (Special Thanks to [derklaro](https://github.com/derklaro) and [0utplay](https://github.com/0utplay))
- Active cluster management*
- Player management*
- Manipulation of database entries*
- Easy setup routine for tasks and templates
- **Integration of Cloud Permission System**
- Management of templates and files*
- Integrated text editor*

\* coming soon; not implemented yet


## Setup
Go to [CloudNet-v3](https://github.com/CloudNetService/CloudNet-v3) repository.
Go to actions tab, select the latest actions with the branch `unstable/rewrite` and download the zip file.
Unzip the zip file into a folder and run the launcher.jar.
After stopping with CTRL + C, edit the `launcher.cnl` and change the line
`var cloudnet.updateBranch release` into `var cloudnet.updateBranch unstable/rewrite`.
Restart CloudNet and install the Rest module with `module install CloudNet-Rest`.


## Start to develop
### Prerequisites
- Git
- Flutter
- Android Studio
- CloudNet v4 Node
### How to use
Clone the repository into your [Android Studio](https://developer.android.com/studio).
Run at every change at [freezed](https://pub.dev/packages/freezed) model this command:
```shell
flutter pub run build_runner build
```
Then go to the top bar next the debugging button and press `Edit configuration`.
Add new flutter configuration and use as dart main following file: `main_alpha.dart`. 
And add also at `Build Flavor` `alpha` as value. 
