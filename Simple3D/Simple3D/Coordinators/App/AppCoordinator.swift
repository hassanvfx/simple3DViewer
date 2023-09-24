//
//  AppCoordinator.swift
//  Simple3D
//
//  Created by Eon Fluxor on 9/23/23.
//

import SwiftUI
import S3DCoreModels
import Resolver
import S3D3DViewer
import S3DLoginKit
import S3DBaseAPI

class AppCoordinator: ObservableObject {
    struct State:Codable,Hashable{
        var session:SessionItem?
    }
    @Published var state = State()
    @LazyInjected var navigator: AppNavigator
    var loginModel:LoginViewModel!
    init(){
        Task{
            let api:BaseAPI = Resolver.resolve()
            let loginModel = await LoginViewModel(api: api) { session in
                DispatchQueue.main.async { [weak self] in
                    self?.login(session: session)
                }
            }
            self.loginModel = loginModel
        }
    }
}

extension AppCoordinator{
    func login(session:SessionItem){
        state.session = session
    }
    func logout(){
        state.session = nil
    }
}

extension AppCoordinator{
    func push(mediaItem:MediaItem){
        guard let url = Bundle.main.url(forResource: "model", withExtension: "usdz") else {
           fatalError()
        }
        let mockMedia = MediaItem(url:url)
        let model = ScenekitModel(item: mockMedia)
        let view = Detail3DView(model: model)
        let hosted = UIHostingController(rootView: view)
        hosted.view.layoutMargins = .zero
        navigator.push(controller: hosted)
    }
}
