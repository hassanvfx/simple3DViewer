# Personal 3D Object Viewer

## Background
This project is a simple iOS application that allows users to view and interact with a 3D object. The application also includes a gallery view and a mock AWS integration for user authentication.

A comprehensive medium article is available here:
[Medium Tutorial](https://twinchat.medium.com/building-reactive-applications-with-swiftui-and-combine-a-tutorial-on-ios-app-simple3d-25d18eef7649)

## Architecture
The application will follow a modular architecture using Swift Package Manager (SPM), with the Model-View-ViewModel (MVVM) design pattern, Dependency Injection (DI), Test-Driven Development (TDD), and clean declarative code.

### Layers
1. **Core Layer**: This layer contains primitive/atomic modules that cannot compose among them and are atomic resources. These include:
   - `CoreUI`: Contains shareable UI components.
   - `CoreAPI`: Interfaces with the Signup API.
   - https://github.com/hassanvfx/ios-coreSampleAPI
   - `CoreStorage`: Dedicated to persisting state.
   - https://github.com/hassanvfx/ios-storage
   - `CoreTypes`: Contains all the structs for business logic.

2. **Middleware Layer**: This layer contains single-purpose components that can link the core layer but also can be composed among them in a horizontal dependency to produce more complex components. These include:
   - `3D Viewer Module`: Allows users to view and interact with a 3D object.
   - https://github.com/hassanvfx/ios-sk3dviewer
   - `Login/Signup Module`: Handles user authentication.
   - https://github.com/hassanvfx/ios-loginKit
   - `Gallery Viewer Component`: Displays a gallery of 3D objects.

3. **Application Layer**: This layer imports the middleware and core modules as needed and presents a navigation and controls an internal application state. It allows for the signup sequence, and then optionally shows a logout state, which forces the signup flow and then once an auth token/userId are obtained those are persisted and used in subsequent calls, as well as to present the main navigation which will allow to navigate to the user scan or the gallery.

## AWS Integration
In this project, we will mock the AWS integration. In a real-world scenario, it is advised to create a simple backend that acts as a single entry point rather than going to AWS from the client. This is to ensure the source of truth sync. The backend can provide two endpoints for signing with a phone number, one for requesting a 2FA code for a given phone number and another that validates the pair of 2FA code and phone number. After validation, the backend can determine if there is a user account with that given phone number and retrieve or else create a new user record and finally formulate the JWT token signing the specific userId.

*Note: In this project, we won't mock the AWS integration but rather simulate that there is a backend side API for auth.*

## 3D Viewer Implementation with SceneKit and SwiftUI

For the 3D viewer functionality, we will be using SceneKit, a powerful native framework in iOS for rendering 3D graphics. SceneKit allows us to create and manipulate 3D objects with ease. 

### Basic Implementation

The basic implementation of a 3D viewer using SceneKit within SwiftUI involves the following steps:

1. **Create a SceneView**: SceneView is a SwiftUI view that hosts a SceneKit scene. We will create a SceneView and configure it to display our 3D object.

```swift
import SwiftUI
import SceneKit

struct SceneView: UIViewRepresentable {
    let scene: SCNScene

    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.scene = scene
        view.allowsCameraControl = true
        return view
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}
```

2. **Load the 3D Object**: We will load the 3D object from a local USDZ file into an SCNScene object. This object will be passed to our SceneView. We will handle the potential error using a do-catch block.

```swift
do {
    let scene = try SCNScene(url: Bundle.main.url(forResource: "YourModel", withExtension: "usdz")!, options: nil)
    let sceneView = SceneView(scene: scene)
} catch {
    print("Failed to load the 3D model.")
}
```

3. **Display the SceneView**: Finally, we will display the SceneView within our SwiftUI view hierarchy. We will handle the potential error using a do-catch block.

```swift
struct ContentView: View {
    var body: some View {
        do {
            let scene = try SCNScene(url: Bundle.main.url(forResource: "YourModel", withExtension: "usdz")!, options: nil)
            SceneView(scene: scene)
        } catch {
            Text("Failed to load the 3D model.")
        }
    }
}
```

This basic implementation allows us to display a 3D object and manipulate it using touch gestures. However, for a more advanced 3D viewer, we may need to add additional features such as lighting, animations, and physics.

## Asset Management

In this simple implementation, the 3D asset is stored locally within the app. However, in a production environment, we may need to download 3D assets from S3 buckets or other cloud storage solutions. Therefore, a more advanced implementation would involve creating a download/caching manager for handling the downloading and caching of 3D assets.

# Implementation

For the implementation, this will serve as the main repository and then we will use the following ios-framework template to encapsulate all the modules:
https://github.com/hassanvfx/ios-framework

* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

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


