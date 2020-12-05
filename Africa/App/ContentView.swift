//
//  ContentView.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 28/11/20.
//

import SwiftUI

struct ContentView: View {
//    MARK:-PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
//    Dynamic Grid and other properties to Switch Layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
//    MARK:-FUNCTIONS
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        //TOOLBAR ICON SWITCHER
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    var body: some View {
        //    MARK:-BODY
        NavigationView{
            Group{
                if !isGridViewActive{
                    List{
                        CoverImageView()
                            .frame(height:300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination:AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }//:LINK
                        }
                    }
                } else {
                    ScrollView (.vertical,showsIndicators:false) {
                        LazyVGrid(columns:gridLayout,alignment: .center,spacing:10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//:NAVIGATION LINK
                            }//:LOOP
                        }//GRID
                        .padding()
                        .animation(.easeIn)
                    }//:SCROLLVIEW
                }//:List
            }//:GROUP
            .navigationBarTitle("Africa",displayMode: .large )
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack{
                        //LIST
                        Button(action: {
                            print("ListView is activate")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                         Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        //GRID
                        Button(action: {
                            isGridViewActive = true
                            print("GridView is activated")
                            gridSwitch()
                            haptics.impactOccurred()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }//BUTTON-GRID
                    }//:HSTACK
                }//:TOOLBAR
            })
        }//:NavigationView
    }
}
//      MARK:-PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
