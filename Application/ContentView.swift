//
//  ContentView.swift
//  Application
//
//  Created by Keith Lehman on 4/6/24.
//

import SwiftUI

struct Notification: Identifiable, Hashable {
    let id: String
    let title: String
    let info: String
}

let notifications = [
    Notification(
        id: "0",
        title: "Low Moisture Detected",
        info: "Soil mositure levels are lower than optimal. Please consider increasing irrigation to ensure healthy plant growth."),
    Notification(
        id: "1",
        title: "High Nutrient Concentration",
        info: "Nutrient levels are above the recommended threshold. Please dilute your nutrient solution to avoid nutrient burn.")
]

struct ContentView: View {
    var body: some View {
        TabView {
            ZStack {
                Color(.red)
                VStack{
                    Text("Machine Learning")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
            }
                .tabItem {
                    Color(.green)
                    Image(systemName: "circle.grid.3x3.fill")
                    Text("Learning")
                }
            ZStack {
                Color(.red)
                VStack{
                    Text("Reports")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
            }
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Reports")
                }
            ZStack {
                Color(.red)
                VStack{
                    Text("My EctoEden")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
            }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("My EctoEden")
                }
            ZStack {
                Color(.red)
                VStack{
                    Text("Notifications")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    
                    List {
                        ForEach(notifications, id: \.self) {
                            notif in
                            VStack(alignment: .leading){
                                HStack{
                                    Text(notif.title)
                                        .font(.title3)
                                    Spacer()
                                    Image(systemName: "clear")
                                }
                                    .padding(.bottom)
                                Text(notif.info)
                                    .font(.caption2)
                            }
                            .padding(.all)
                            
                        }
                    }
                }
            }
                .tabItem {
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Notifications")
                }
            ZStack {
                Color(.red)
                VStack{
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
            }
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
