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

struct RootView: View {
    @InjectedObject var nav: Navigator<DemoTabs>

    var body: some View {
        ZStack {
            TabNavViewController<DemoTabs>.DisplayView(nav: nav)
                .edgesIgnoringSafeArea(.all)

            NavigatorTabBarView<DemoTabs>(nav: nav)
        }
        .lux
        .tweak(.canvasSurface)
        .style(.panel)
        .view
    }
}
