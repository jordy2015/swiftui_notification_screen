//
//  NotificationViewModel.swift
//  Notification Screen
//
//  Created by Jordy Gonzalez on 2/15/23.
//

import Foundation

class NotificationViewModel: ObservableObject {
    @Published var movies: [NotificationContent] = []
    @Published var isLoading: Bool = false
    @Published var onError: Error? = nil
    
    func fetchNotification() {
        isLoading = true
        DispatchQueue.global().async {
            var tempList: [NotificationContent] = []
            for i in 0...20 {
                let tag = "@user tag #\(i)"
                let title = "title \(i)"
                let message = "this is the message #\(i)"
                let image = "swift-logo"
                tempList.append(NotificationContent(title: title,
                                                    tag: tag,
                                                    message: message,
                                                    imageUrl: image,
                                                    notificationType: NotificationType(rawValue: Int.random(in: 1...7))!))
                usleep(333333)
            }
            
            DispatchQueue.main.sync {
                self.isLoading = false
                self.movies.append(contentsOf: tempList)
            }
        }
    }
}
