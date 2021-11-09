//
//  Weather.swift
//  SwiftUITutorialDemo
//
//  Created by 黃建程 on 2021/11/9.
//

import SwiftUI

// 之後講述 ObservableObject 生命週期的差異，因此會順便介紹 @StateObject
class Weather: ObservableObject {
    @Published var isHot = true
    @Published var temp = 30
}

struct WeatherView: View {

    @ObservedObject var weather = Weather()
    
    var body: some View {
        
        VStack (spacing: 30){
            
            Text("現在溫度: \(weather.temp)")
            
            Text(weather.isHot == true ? "天氣好熱" : "天氣舒適")
            
            Button(action: {
                weather.temp = weather.temp + 1
                if weather.temp >= 30 {
                    weather.isHot = true
                }
            }) {
                Text("升溫")
            }
            
            Button(action: {
                weather.temp = weather.temp - 1
                if weather.temp < 30 {
                    weather.isHot = false
                }
            }) {
                Text("降溫")
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
