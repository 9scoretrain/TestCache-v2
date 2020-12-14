//
//  ImageListView.swift
//  cc
//
//  Created by dph on 2020/12/14.
//

import SwiftUI

struct ImageListView: View {
        
    var body: some View {
        NavigationView {
            List(ImageAPI.data, id: \.self) { item in
                ImageListItemView(item: item)
            }
        }
    }
}



struct ImageListItemView: View {
    var item: ImageItemModel
    @Environment(\.myImageCacheKey) var cache: MyImageCache
    
    var body: some View {
        AsyncImageView(urlString: item.urlString, cache: cache)
    }
}


struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView()
    }
}
