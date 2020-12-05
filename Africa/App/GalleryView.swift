//
//  GalleryView.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 28/11/20.
//

import SwiftUI

struct GalleryView: View {
//    MARK:-PROPERTIES
    @State private var selectedAnimal:String = "lion"
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
//    SIMPLE GRID DEFNINTION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
//  Efficient Grid
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwtich() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    var body: some View {
        ScrollView(.vertical,showsIndicators:false  ) {
            VStack (alignment:.center,spacing: 30){
                //      MARK:-IMAGE
                            Image(selectedAnimal)
                                .resizable()
                                .scaledToFit()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .overlay(Circle().stroke(Color.white,lineWidth: 8))
//                MARK:-SLIDER
                Slider(value: $gridColumn,in:2...4,step:1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwtich()
                    })
                //      MARK:-GRID
                 LazyVGrid(columns:gridLayout,alignment:.center,spacing:10) {
                    ForEach(animals ) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }//:LOOP
                }//:VSTACK
                 .padding(.horizontal,10)
                 .padding(.vertical,50)
            }//:GRID
            .animation(.easeIn)
            .onAppear(perform: {
                gridSwtich()
            })
        }//:SCROLL
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
