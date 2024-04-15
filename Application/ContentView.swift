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

struct Report: Identifiable, Hashable{
    let id: String
    let status: String
    let timestamp: Date
    let temperature: Float
    let humidity: Float
    let ph: Float
}

let reports = [
    Report(
        id: "0",
        status: "OK",
        timestamp: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 20, hour: 16, minute: 20))!,
        temperature: 24,
        humidity: 65,
        ph: 6.2
    )
]

struct LoginView: View {
    @Binding var username: String
    @Binding var loggedIn: Bool
    @Binding var password: String
    
    var body: some View {
            VStack {
                Image("EctoEdenIcon")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.bottom, 30)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                
                Button(action: {
                    loggedIn = true;
                    print("Username: \(username), Password: \(password)")
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 50)
                
                Spacer()
            }
            .padding()
        }
}

struct ContentView: View {
    @State var isModal: Bool = false
    @State var username = "Jorge"
    @State var password = ""
    @State var loggedIn = true
    
    var body: some View {
        VStack {
            if loggedIn {
                HStack {
                    Text(username + "'s Garden")
                    
                    Button("Log Out") {
                        loggedIn = false;
                    }
                }
                
            }else {
                Button("Login") {
                    self.isModal = true
                }.sheet(isPresented: $isModal, content: {
                    LoginView(username: $username, loggedIn: $loggedIn, password: $password)
                })
            }
            
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
                        List {
                            ForEach(reports, id: \.self) {
                                report in
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(report.timestamp, style: .date)
                                            .font(.title3)
                                        Text(report.timestamp, style: .time)
                                            .font(.title3)
                                        Spacer()
                                        Image(systemName: "clear")
                                    }
                                    .padding(.bottom)
                                    Text("Status: " + report.status)
                                        .font(.footnote)
                                    Text("Temperature: " + String(format: "%.2f", report.temperature))
                                        .font(.footnote)
                                    Text("Humidity: " + String(format: "%.2f", report.humidity))
                                        .font(.footnote)
                                    Text("pH: " + String(format: "%.2f", report.ph))
                                        .font(.footnote)
                                }
                                .padding(.all)
                                
                            }
                        }
                        
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
