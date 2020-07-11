//
//  ContentView.swift
//  Expandable List View
//
//  Copyright © MITLicense. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Variables
    @State private var selectedCellArray: Set<DummyData> = []
    let dummyArray: [DummyData]
    
    // MARK: - View
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(dummyArray) { about in
                    ContentViewCell(data: about,
                                    isExpanded: self.selectedCellArray.contains(about))
                        .modifier(ScrollCell())
                        .onTapGesture { self.handleCellTap(about) }
                        .animation(.linear(duration: 0.3))
                        .padding([.top, .bottom], 2)
                }
            }
            .padding(.top, 10)
            .navigationBarTitle("Expandable List", displayMode: .automatic)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func handleCellTap(_ about: DummyData) {
        if selectedCellArray.contains(about) {
            selectedCellArray.remove(about)
        } else {
            selectedCellArray.insert(about)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dummyArray: DummyData.dataArray())
    }
}
