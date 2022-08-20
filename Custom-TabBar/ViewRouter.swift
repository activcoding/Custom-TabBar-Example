//
//  ViewRouter.swift
//  Custom-TabBar
//
//  Created by Tommy Ludwig on 20.08.22.
//

import SwiftUI

class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .home
}

enum Page{
    case home
    case view2
    case view3
}

