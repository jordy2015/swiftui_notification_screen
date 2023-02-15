//
//  NotificationView.swift
//  Notification Screen
//
//  Created by Jordy Gonzalez on 2/15/23.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var viewModel = NotificationViewModel()
    
    init() {
        viewModel.fetchNotification()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color(red: 164/255, green: 230/255, blue: 241/255), Color(red: 123/255, green: 214/255, blue: 164/255)],
                               startPoint: .top,
                               endPoint: .center).edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 15)
                    ], spacing: 15) {
                        ForEach (viewModel.movies, id: \.id) { notificationContent in
                            NotificationCellView(content: notificationContent)
                        }.frame(minWidth: getheigth(), maxWidth: getheigth(), minHeight: 150).background(Color(red: 223 / 255, green: 248 / 255, blue: 246 / 255)).cornerRadius(5)
                    }
                }.padding(.top)
                if viewModel.isLoading {
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
    
    func getheigth() -> CGFloat {
        return UIScreen.main.bounds.width - 12 * 2
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
