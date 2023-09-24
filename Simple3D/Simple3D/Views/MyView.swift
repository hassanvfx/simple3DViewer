//
//  MyView.swift
//  Simple3D
//
//  Created by Eon Fluxor on 9/24/23.
//

import SwiftUI
import Resolver
struct MyView: View{
    @Injected var app:AppCoordinator
    var body: some View{
        VStack{
            Spacer()
            Button(action:app.logout){
                Text("Logout")
            }
            Spacer()
        }
    }
}
