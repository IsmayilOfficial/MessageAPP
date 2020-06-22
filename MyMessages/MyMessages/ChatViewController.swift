//
//  ChatViewController.swift
//  MyMessages
//
//  Created by Ismayil Tahmazov on 22.06.2020.
//  Copyright © 2020 Ismayil Tahmazov. All rights reserved.
//

import UIKit
import MessageKit

struct  sender: SenderType {
    var senderId: String
    
    var displayName: String
    
    
}
struct Message: MessageType {
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
    
    
}

class ChatViewController: MessagesViewController, MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate {
    let currentUser = Sender(senderId: "self", displayName: "FM corporation")
    let otherUser = Sender(senderId: "other", displayName: "Ismayil Tahmazov")
    var  messages = [MessageType]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hello from tartu")))
        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-86400),
                                     kind: .text("How are you ")))
        messages.append(Message(sender: otherUser, messageId: "4", sentDate: Date().addingTimeInterval(-86400),
                                     kind: .text("like shit")))
        messages.append(Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-86400),
                                     kind: .text("yes"  )))
        messages.append(Message(sender: otherUser, messageId: "6", sentDate: Date().addingTimeInterval(-86400),
                                     kind: .text("bye")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        
    }
    
    func currentSender() -> SenderType {
           return currentUser
       }
       
       func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
       }
       
       func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
       }
       

}
