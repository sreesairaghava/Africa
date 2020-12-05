//
//  CoverImageView.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 28/11/20.
//

import SwiftUI

struct CoverImageView: View {
    //MARK:-PROPERTIES
    let CoverImages:[CoverImage] = Bundle.main.decode("covers.json")
    //MARK:-BODY
    var body: some View {
        TabView{
            ForEach(CoverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }//:TABVIEW
        .tabViewStyle(PageTabViewStyle())
    }
}
//MARK:-PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300 ))
    }
}
