//
//  ContentView.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Lux
import NavigatorLib
import Resolver
import SwiftUI
import S3DLoginKit

struct RootView: View {
    @InjectedObject var nav: AppNavigator
    @InjectedObject var app: AppCoordinator

    var body: some View {
        ZStack {
            
            AppTabView(nav: nav)
                .edgesIgnoringSafeArea(.all)
            
            AppTabbarView(nav: nav)
            
            if app.state.session == nil {
                LoginView(model:app.loginModel)
                    .frame(maxHeight:.greatestFiniteMagnitude)
            }
        }
        .lux
        .tweak(.canvasSurface)
        .style(.panel)
        .view
    }
}
