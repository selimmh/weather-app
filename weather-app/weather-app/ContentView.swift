//
//  ContentView.swift
//  weather-app
//
//  Created by selimmh on 01.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var daySwitch = false
    
    var body: some View {
        ZStack {
            
            BackgroundColor(topColor: daySwitch ? .black: .blue,
                            bottomColor: daySwitch ? .gray: .white)
            
            VStack {
                
                CityName(cityName: "Ashgabat, TM")
                todaysTemp(imageName: daySwitch ? "moon.stars.fill":"cloud.sun.fill",
                           temperature: daySwitch ? 10: 25)
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing:25) {
                        
                        WeekDays(daysName: "MON", imageName: "cloud.sun.fill", temperature: 15)
                        WeekDays(daysName: "TUE", imageName: "wind.snow", temperature: 18)
                        WeekDays(daysName: "WED", imageName: "snow", temperature: 5)
                        WeekDays(daysName: "THU", imageName: "sun.max.fill", temperature: 35)
                        WeekDays(daysName: "FRI", imageName: "cloud.bolt.fill", temperature: 10)
                    
                }

                    Spacer()
                        
                    Button {
                        daySwitch.toggle()
                        
                    }label:{
                            
                        WeatherButton(title: daySwitch ? "Light Mode" : "Dark Mode",
                                      textColor: daySwitch ? .white: .blue,
                                      buttonColor: daySwitch ? .blue:.white)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeekDays: View {
    
    var daysName: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(daysName)
                .font(.system(size: 15, weight: .semibold, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .font(.system(size: 30))
                .padding(.vertical,5)
            
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColor: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient.init(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .leading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityName: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .padding()
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct todaysTemp: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .font(.system(size: 100))
                .padding(.bottom,20)
            
            Text("\(temperature)℃")
                .font(.system(size: 40, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(.bottom, 50)
        }
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var buttonColor: Color
    
    var body: some View {
        Text(title)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .frame(width: 280, height: 50, alignment: .center)
            .background(buttonColor)
            .cornerRadius(10)
    }
}
