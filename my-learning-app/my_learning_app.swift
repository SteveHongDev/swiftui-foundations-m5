//
//  my_learning_app.swift
//  my-learning-app
//
//  Created by 홍성범 on 2022/02/17.
//

import SwiftUI

@main
struct my_learning_app: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
