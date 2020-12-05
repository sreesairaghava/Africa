//
//  MainView.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 28/11/20.
//

import SwiftUI

struct MainView: View {
//    MARK:-PROPERTIES
    
//    MARK:-BODY
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            VideoListView()
                .tabItem { Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            GalleryView()
                .tabItem { Image(systemName: "photo")
                    Text("Gallery")
                }
        }//:TABVIEW
    }
}
//MARK: PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
