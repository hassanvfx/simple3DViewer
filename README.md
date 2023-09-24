# Simple 3D Viewer

https://github.com/hassanvfx/simple3DViewer/assets/425926/2735b9cf-eaba-416a-9a11-74b25a0f15b8
> Play the video

## Background

This project is a simple iOS application that allows users to view and interact with a 3D object. The application also includes a gallery view and a mock AWS integration for user authentication.

A comprehensive medium article is available here:
[Medium Tutorial](https://twinchat.medium.com/building-reactive-applications-with-swiftui-and-combine-a-tutorial-on-ios-app-simple3d-25d18eef7649)

# Simple3D App Modularization
<img width="1344" alt="image" src="https://github.com/hassanvfx/simple3DViewer/assets/425926/251b8d79-c2dd-49d5-a597-59e8d5db7deb">

This repository contains the Simple3D App, a modularized iOS application built using SwiftUI, Combine, and Swift Package Manager (SPM) conventions. The app is structured into several modules, each with its own repository, to promote a more organized, maintainable, and scalable codebase.

## Components

The Simple3D App is composed of the following modules:

- **Core Layer**: CoreUI, CodeModels, BaseAPI, Base3DViewer, BaseGallery
- **MiddleWare Components**: LoginKit
- **Application**: This module coordinates the application state and orchestrates the user experience and data persistence. It includes components such as Storage, Navigation, Persistence, AppState, RootNavigation, Gallery, UserScan, and LoginWall.

## Contribution and Maintenance

To contribute to the Simple3D App, you will need to create repositories for the corresponding modules: Core3DViewer, CoreUI, BaseAPI, BaseGallery, and LoginKit. Each repository should be cloned from the [ios-framework repository](https://github.com/hassanvfx/ios-framework) and renamed using the `config` tool. For example, the CoreUI repository would be renamed to S3DCoreUI.

Once the repositories are set up, you can start building the app. Each module has its own specific implementation details, which are outlined in the original documentation. 

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
- https://github.com/hassanvfx/ios-framework

# MVVM + Coordinator

<img width="977" alt="mvvm-c" src="https://user-images.githubusercontent.com/425926/190287169-26eb85cf-2b11-40a6-9c9d-dfa786a059a8.png">

## Conclusion

![Demo](https://github.com/hassanvfx/simple3DViewer/assets/425926/67bcacec-6245-4122-a276-c35e0e1b03a6)

The Simple3D App provides a practical example of how to construct large scalable codebases using SwiftUI, Combine, and SPM Conventions. By following the principles of Dependency Injection, Modularization, SOLID, and the MVVM Architecture, you can create a more organized, maintainable, and scalable codebase for your iOS applications.



