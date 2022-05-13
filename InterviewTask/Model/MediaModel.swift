//
//  MediaModel.swift
//  InterviewTask
//
//  Created by Reshma on 14/03/21.
//

import UIKit

struct MediaModel : Decodable {
    let title: String
    let id: String
    let description : String
    let thumb : String
    let url : String
     
    enum CodingKeys: String, CodingKey {
      case title
      case id
      case description
      case thumb
      case url
        
    }
}

