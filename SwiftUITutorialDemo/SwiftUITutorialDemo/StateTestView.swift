//
//  StateTestView.swift
//  SwiftUITutorialDemo
//
//  Created by 黃建程 on 2021/11/9.
//

import SwiftUI

struct StateTestView: View {
    // 建議state要使用 private（如果沒有要披露出去的話）
    @State private var score: Float = 0.0
    
    var body: some View {
        VStack {
            Text("Value: \(self.score)")
            Button {
                self.score = self.score + 1.0
            } label: {
                Text("Press me to add 1")
            }

            Slider(value: $score, in: 1...100)
            
            Divider()
                .foregroundColor(.blue)

            BindingViewDemo(score: $score)
        }
    }
}

struct SomeStruct {
    var age: Int
    var name: String
}

struct BindingViewDemo: View {
    
    @Binding var score: Float
    
    var isPlaying: Bool {
        return score > 50.0
    }
    
    var body: some View {
        VStack {
            Text("magic play button")
            Button {
                self.score = self.score + 20
            } label: {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                    .imageScale(.large)
            }
        }
    }
}

struct StateTestView_Previews: PreviewProvider {
    static var previews: some View {
        StateTestView()
    }
}
