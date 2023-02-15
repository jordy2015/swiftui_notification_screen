//
//  NotificationContent.swift
//  Notification Screen
//
//  Created by Jordy Gonzalez on 2/15/23.
//

import Foundation

import Foundation

class NotificationContent: Identifiable {
    let id = UUID()
    var title: String?
    var tag: String?
    var message: String = ""
    var imageUrl: String?
    var notificationType: NotificationType = .none
    var opened: Bool = false
    
    init(title: String? = nil, tag: String? = nil, message: String, imageUrl: String? = nil, notificationType: NotificationType) {
        self.title = title
        self.tag = tag
        self.message = message
        self.imageUrl = imageUrl
        self.notificationType = notificationType
    }
}

enum NotificationType: Int {
    case Announcement = 1, Follow = 2, Followed = 3, AnnouncementWithUrl = 4
    case NewTool = 5, Invite = 6, Complete = 7, none = 0
    
    var shoudDisplayTile: Bool {
        switch self {
        case .Announcement, .Followed, .AnnouncementWithUrl, .NewTool, .Invite, .Complete:
            return true
        default:
            return false
        }
    }
    
    var shouldDisplayTag: Bool {
        switch self {
        case .Follow, .Followed:
            return true
        default:
            return false
        }
    }
    
    var shouldDisplayImage: Bool {
        switch self {
        case .Follow, .AnnouncementWithUrl, .NewTool:
            return true
        default:
            return false
        }
    }
    
    var ctaTitle: String {
        switch self {
        case .Invite:
            return "Play Now"
        case .Announcement, .Followed, .Follow:
            return "Have a look"
        default:
            return "Join"
        }
    }
}
