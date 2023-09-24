# Personal 3D Object Viewer

![Demo](https://github.com/hassanvfx/simple3DViewer/assets/425926/37528c11-8430-419c-a73c-df534c4d4161)

## Background
This project is a simple iOS application that allows users to view and interact with a 3D object. The application also includes a gallery view and a mock AWS integration for user authentication.

A comprehensive medium article is available here:
[Medium Tutorial](https://twinchat.medium.com/building-reactive-applications-with-swiftui-and-combine-a-tutorial-on-ios-app-simple3d-25d18eef7649)

## Modular Components

- https://github.com/hassanvfx/s3d-coremodels
- https://github.com/hassanvfx/s3d-coreui
- https://github.com/hassanvfx/s3d-baseapi
- https://github.com/hassanvfx/s3d-loginkit
- https://github.com/hassanvfx/s3d-3dviewer
- https://github.com/hassanvfx/s3d-basegallery

## External libraries

- Navigation: https://github.com/hassanvfx/ios-navigator
- API: https://github.com/Moya/Moya

## Asset Management

In this simple implementation, the 3D asset is stored locally within the app. However, in a production environment, we may need to download 3D assets from S3 buckets or other cloud storage solutions. Therefore, a more advanced implementation would involve creating a download/caching manager for handling the downloading and caching of 3D assets.

# Modularization

For the SPM modularization, we'll be using the ios-framework tandem tool:
https://github.com/hassanvfx/ios-framework

# How do I get set up? ###

* Disable automatic updates for your machine
* As a team we'll sync to the lastest stable OS/ Xcode Release

### SwiftFormat

Please configure `swiftformat` git prehook in your terminal
https://github.com/nicklockwood/SwiftFormat#git-pre-commit-hook

 pre-commit hook:
```
#!/bin/sh
git-format-staged --formatter "swiftformat --swiftversion 5.2 stdin --stdinpath '{}'" "*.swift"
```

### ZCH Customization ###

You may want to use this terminal tool that helps improving the promt display!
https://ohmyz.sh/#install

### Contribute with Git Flow ###

Please follow Git Flow (Git Tower client also recommended).
https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow#:~:text=Gitflow%20Workflow%20is%20a%20Git,designed%20around%20the%20project%20release.

The overall flow of Gitflow is

1. A `develop` branch is created from `master`
1. A `release` branch is created from `develop`
1. `feature` branches are created from `develop`
1. When a `feature` is complete it is merged into the `develop` branch
1. When the `release` branch is done it is merged into `develop` and `master`
1. If an issue in master is detected a `hotfix` branch is created from `master`
1. Once the `hotfix` is complete it is merged to both `develop` and `master`

### Contribution guidelines ###

* Favor well tested solutions 
* Favor apple solutions 
* Modern iOS16 SwiftUI  MVVM app delegate scene
* Traditional UIKit MVC for Top Controllers 
* Top level UIKit View controller composition
* Snapkit for Autolayout and transitions
* SwiftUI for discreet View level components
* Favor SPM for vendors and always fork before prod linking

# Architecture 

The application is based on a modularized design with individual SPM modules linked into the main App.

We aim for composition pattern in which modules are encapsulated as SPM packages. Use the following template that allows to develop the SPM within a DemoApp environment that enables functional demonstration and unit/UI test cases in pure isolation.

The framework template can be found in here:
https://github.com/hassanvfx/ios-framework

## Modules

```
+-----------------------------+
|                             |
|         Application         |
|                             |
+-----------------------------+
+-----------------------------+
|                             |
|        MiddleWare           |
|                             |
| Composable Libraries        |
+-----------------------------+
+-----------------------------+
|                             |
|            Core             |
|                             |
| Atomic Libraries            |
+-----------------------------+
```
Below is a list of the related libraries:

MiddleWare
- [Navigator](https://github.com/hassanvfx/ios-navigator)
- [Datastorage](https://github.com/hassanvfx/ios-storage)
- [VideoPlayer (SwiftUI AVPlayer)](https://github.com/hassanvfx/ios-swiftuivideoplayer)
- [LoginKit](https://github.com/hassanvfx/ios-loginKit)
- [3D Viewer](https://github.com/hassanvfx/ios-sk3dviewer)

Core
- [Core API](https://github.com/hassanvfx/ios-coreSampleAPI)

Future Middleware Components 
- Gallery Component

Future Core Componets
- Core Types
- AssetManager
- FileServices
- PermissionServices

# Arch Patterns

<img width="977" alt="mvvm-c" src="https://user-images.githubusercontent.com/425926/190287169-26eb85cf-2b11-40a6-9c9d-dfa786a059a8.png">

* Modularized SPM based features see: https://github.com/hassanvfx/ios-framework
* Favoring Static and Test Driven Code over dynamic  code
* Prefer High order functional style
* Keep functions atomic and descriptive
* Favor single purpose functions and expressive pipelining 
* App coordinator with injection friendly singletons for mock/ test
* Favor Traditional UIKit application style through a Main Tab Bar Controller 
* SwiftUI for scene description and sheets presentations
* Prefer Traditional UIkit hero style composition + custom transitions (note: unless we support iOS14>)
* Use traditional View controllers for view lifecycle and SwiftUI as a code replacement for interface builder 


### Roadmap ###

Current planing updated here:
- TODO

### Licensing ###

Last audited on TODP

iOS repo URLs	Licence 
-  TODO


### More Docs ###

- TODO


