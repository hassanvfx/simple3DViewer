//
//  Constants.swift
//  Navigator
//
//  Created by hassan uriostegui on 8/28/22.
//

import NavigatorLib
import SwiftUI
import UIKit

typealias AppNavigator = Navigator<DemoTabs>
typealias AppTabView = TabNavViewController<DemoTabs>.DisplayView
typealias AppTabbarView = NavigatorTabBarView<DemoTabs>

enum DemoTabs: Int, NavigatorTabItem {
    case home,
         store,
         me

    var image: UIImage {
        UIImage(named: "circle")!
    }

    var imageActive: UIImage {
        UIImage(named: "circle.fill")!
    }

    var intValue: Int {
        rawValue
    }

    var tapOverride: (() -> Void)? {
        return nil
    }

    var displayName: String {
        switch self {
        case .home:
            return "Home"
        case .store:
            return "Store"
        case .me:
            return "Me"
        }
    }

    func navFactory(tabController: TabNavViewController<DemoTabs>) -> () -> UINavigationController {
        switch self {
        case .home:
            return { tabController.linkAsNavigationController(root: User3DView()) }
        case .store:
            return { tabController.linkAsNavigationController(root: ShopGallery()) }
        case .me:
            return { tabController.linkAsNavigationController(root: MyView()) }
        }
    }

    static func item(idx: Int) -> DemoTabs {
        switch idx {
        case 0:
            return .home
        case 1:
            return .store
        case 2:
            return .me
        default:
            fatalError()
        }
    }

    static var allItems: [DemoTabs] {
        [.home, .store, .me]
    }

    static var defaultItem: DemoTabs {
        .home
    }
}

public enum Sheet: String {
    case measurementsInfo,
         meEditor,
         outfitPicker,
         scenePicker,
         wallet
}
