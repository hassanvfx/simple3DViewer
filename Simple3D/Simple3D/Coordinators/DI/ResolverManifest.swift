//
//  Resolver+Config.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import Foundation
import NavigatorLib
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        Resolver.register { Navigator<DemoTabs>() }
            .scope(.application)
    }
}
