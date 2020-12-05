//
//  InsetFactView.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 29/11/20.
//

import SwiftUI

struct InsetFactView: View {
//    MARK:-PROPERTIES
    let animal: Animal
//    MARK:-BODY
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact,id:\.self) { item in
                    Text(item)
                }
            }//:TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight:148,idealHeight: 169,maxHeight: 180 )
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals :[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[1] )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
