//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 29/11/20.
//

import SwiftUI

struct ExternalWebLinkView: View {
//    MARK:-PROPERTIES
    let animal: Animal
//    MARK:-BODY
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.accentColor)
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://www.wikepedia.org"))!)
                }
            }//:HSTACK
        }//:BOX
    }
}
//    MARK:-PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
