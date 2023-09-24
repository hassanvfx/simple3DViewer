//
//  User3dView.swift
//  Simple3D
//
//  Created by Eon Fluxor on 9/23/23.
//

import SwiftUI
import S3D3DViewer
import S3DCoreModels
import NavigatorLib
import CoreUIKit

struct User3DView: View{
    @ObservedObject var model:ScenekitModel
    
    init(){
        guard let url = Bundle.main.url(forResource: "model", withExtension: "usdz") else {
           fatalError()
        }
        let media = MediaItem(url:url)
        self.model =  ScenekitModel(item: media)
    }
    
    var body: some View{
            ScenekitView(model: model)
        
    }
}
