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

struct Detail3DView: View{
    @ObservedObject var model:ScenekitModel

    var body: some View{
       
        NavView( title: model.item.title ?? "3d Viewer",leftAction: .back) {
            ScenekitView(model: model)
        }
   
    }
}
