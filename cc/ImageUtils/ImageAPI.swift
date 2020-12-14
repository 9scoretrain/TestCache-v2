//
//  ImageAPI.swift
//  cc
//
//  Created by dph on 2020/12/14.
//

import Foundation


struct ImageAPI {
    static let data: [ImageItemModel] =
        [ImageItemModel(urlString:"https://www.jobyme88.com/wp-content/uploads/2020/11/50d0-kj-classroom-0.jpg"),
         ImageItemModel(urlString:"https://www.jobyme88.com/wp-content/uploads/2020/11/50d0-kj-classroom-1.jpg"),
         ImageItemModel(urlString:"https://www.jobyme88.com/wp-content/uploads/2020/11/50d0-kj-classroom-2.jpg"),
         ImageItemModel(urlString:"https://www.jobyme88.com/wp-content/uploads/2020/11/50d0-kj-classroom-3.jpg"),
         ImageItemModel(urlString:"https://www.jobyme88.com/wp-content/uploads/2020/11/50d0-kj-classroom-4.jpg"),
         ImageItemModel(urlString:"https://www.jobyme88.com/wp-content/uploads/2020/11/50d0-kj-classroom-5.jpg")]
}


struct ImageItemModel: Identifiable, Hashable {
    var id = UUID()
    var urlString: String
}
