//
//  Custom_TabBarApp.swift
//  Custom-TabBar
//
//  Created by Tommy Ludwig on 20.08.22.
//

import SwiftUI

@main
struct Custom_TabBarApp: App {
    @StateObject private var viewRouter = ViewRouter()
    @State private var tabbar: Int = UserDefaults.standard.integer(forKey: "Bar")
    var body: some Scene {
        WindowGroup {
            CustomTabBar(viewRouter: viewRouter, tabbar: $tabbar)
        }
    }
}
