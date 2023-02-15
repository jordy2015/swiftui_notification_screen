//
//  NotificationCellView.swift
//  Notification Screen
//
//  Created by Jordy Gonzalez on 2/15/23.
//

import SwiftUI

struct NotificationCellView: View {
    
    var content: NotificationContent
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                if(content.notificationType.shouldDisplayTag) {
                    Text(content.tag ?? "")
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .font(.system(size: 12))
                        .background(Color(red: 190/255, green: 235/255, blue: 242/255))
                        .cornerRadius(8)
                }
                if(content.notificationType.shoudDisplayTile) {
                    Text(content.title ?? "")
                        .font(.system(size: 25))
                        .bold()
                        .padding(.bottom, 2)
                }
                Text(content.message).padding(.bottom, 2)
                
                NavigationLink {
                    NotificationDetailsView(notificationContent: self.content)
                } label: {
                    Text(content.notificationType.ctaTitle).foregroundColor(.black).font(.headline)
                        .fontWeight(.heavy)
                        .background(
                            Color.cyan
                                .frame(height: 3)
                                .offset(y: 12))
                }
            }.padding()
            Spacer()
            if (content.notificationType.shouldDisplayImage) {
                Image(content.imageUrl ?? "").resizable().background(.red).frame(maxWidth: 150/2, maxHeight: 150 - 12 * 2).padding()
            }
        }
    }
}
