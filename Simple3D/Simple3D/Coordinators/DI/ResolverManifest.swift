//
//  Resolver+Config.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Foundation
import NavigatorLib
import Resolver
import S3DLoginKit
import S3DBaseAPI

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        Resolver.register { AppCoordinator() }
            .scope(.application)
        Resolver.register { AppNavigator() }
            .scope(.application)
        Resolver.register { BaseAPI(mocking: true) }
            .scope(.application)
        
        
    }
}
