//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 01/12/20.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
//    MARK:-PREVIEW
    var videoSelected:String
    var videoTitle:String
//    MARK:-BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")){
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:32, height:32)
                    .padding(.top,6)
                    .padding(.horizontal,8)
                ,alignment: .topLeading
            
        )
        }//:VSTACK
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle,displayMode: .inline)
    }
}
//   MARK:-PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
