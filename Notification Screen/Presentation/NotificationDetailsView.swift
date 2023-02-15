//
//  NotificationDetailsView.swift
//  Notification Screen
//
//  Created by Jordy Gonzalez on 2/15/23.
//

import SwiftUI

struct NotificationDetailsView: View {
    
    var notificationContent: NotificationContent

    var body: some View {
        Text(notificationContent.message)
    }
}
