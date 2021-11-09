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
        }
    }
}

struct StateTestView_Previews: PreviewProvider {
    static var previews: some View {
        StateTestView()
    }
}
