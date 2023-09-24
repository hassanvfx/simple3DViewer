//
//  User3dView.swift
//  Simple3D
//
//  Created by Eon Fluxor on 9/23/23.
//

import SwiftUI
import S3DBaseGallery
import S3DCoreModels
import NavigatorLib
import CoreUIKit
import Lux
import Resolver

struct ShopGallery: View{
    @State var items=[MediaItem]()
    @Injected var app:AppCoordinator
    
    var body: some View{
        GalleryView(items: items){ item in
            app.push(mediaItem: item)
        }
        .padding(.top, Lux.NavBarHeight)
        .onAppear(perform: loadItems)
    }
}
extension ShopGallery{
    func loadItems(){
        items = Seed.galleryItems
    }
}
