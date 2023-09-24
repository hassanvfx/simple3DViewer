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

# MVVM + Coordinator

<img width="977" alt="mvvm-c" src="https://user-images.githubusercontent.com/425926/190287169-26eb85cf-2b11-40a6-9c9d-dfa786a059a8.png">



- TODO


