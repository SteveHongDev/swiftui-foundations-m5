//
//  ContentDetailView.swift
//  my-learning-app
//
//  Created by 홍성범 on 2022/03/08.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
        // Only show if url is not nil
            if let url = url {
                VideoPlayer(player: AVPlayer(url: url))
                    .cornerRadius(10)
            }
            
            // TODO: Description
            CodeTextView()
            
            // Show next lesson button if it has
            
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            } else {
                // Show the complete button instead
                Button {
                    model.currentSelectedContent = nil
                } label: {
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Completed")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }

        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
