//
//  TabManager.swift
//  AffordRing
//
//  Created by Harsh Yadav on 04/03/23.
//

import Foundation
import SwiftUI

enum Tabbar:CaseIterable{
    case home
    case categories
    case wishList
    case inbox
    case account
    
    var tabTitle:String{
        switch self {
        case .home:
            return "Home"
        case .categories:
            return "Categories"
        case .wishList:
            return "WishList"
        case .inbox:
            return "Inbox"
        case .account:
            return "Account"
        }
    }
    
    var tabIcon:Image{
        switch self {
        case .home:
            return Image("home")
        case .categories:
            return Image("categories")
        case .wishList:
            return Image("wishlist")
        case .inbox:
            return Image("inbox")
        case .account:
            return Image("account")
        }
    }
}
