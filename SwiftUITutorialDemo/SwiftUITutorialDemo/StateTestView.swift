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
    
    // @state 主要是 structure
    @State private var user: SomeStruct = SomeStruct(age: 20, name: "Spark")
    
    var body: some View {
        VStack {
            
            Text("name: \(self.user.name)")
            
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
            
            Divider()
                .foregroundColor(.blue)
            
            Button {
                self.user.name = "handsome \(self.user.name)"
            } label: {
                Text("be strong")
            }
        }
    }
}

struct SomeStruct {
    var age: Int
    var name: String
}

@propertyWrapper
struct OnehundredOrLess {
    private var number: Float
    // wrappedValue變量的名字是固定的
    var wrappedValue: Float {
        get { return number }
        set { number = min(newValue, 100) }
    }
    
    init() {
        self.number = 0
    }
}

struct BindingViewDemo: View {
    // 無法 private
    @Binding var score: Float
    
    var isPlaying: Bool {
        return score > 50.0
    }
    
    var body: some View {
        VStack {
            Text("magic play button")
            Button {
                @OnehundredOrLess var temp: Float
                temp = self.score + 20
                self.score = temp
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
