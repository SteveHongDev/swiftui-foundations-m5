//
//  ContentView.swift
//  my-learning-app
//
//  Created by 홍성범 on 2022/03/06.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {
                
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink {
                            ContentDetailView().onAppear {
                                model.beginLesson(index)
                            }
                        } label: {
                            ContentViewRow(index: index)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            .foregroundColor(.black)
        }
    }
}
