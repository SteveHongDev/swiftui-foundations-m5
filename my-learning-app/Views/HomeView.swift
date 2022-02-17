//
//  ContentView.swift
//  my-learning-app
//
//  Created by 홍성범 on 2022/02/17.
//

import SwiftUI

struct HomeView: View {
    
    // Environment Object
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
