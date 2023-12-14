//
//  ContentView.swift
//  LearningSwiftUI demoProject3 AdvancedUIComponents
//
//  Created by REVE Systems on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var showActionSheet = false
    @State private var toggleStatus = false

    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollViewProxy in
                List {
                    Section(header: Text("Toggles")) {
                        Toggle(isOn: $toggleStatus) {
                            Text("Enable Feature")
                        }
                    }

                    Section(header: Text("Actions")) {
                        Button("Show Alert") {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Simple Alert"), message: Text("This is an alert message."), dismissButton: .default(Text("OK")))
                        }

                        Button("Show Action Sheet") {
                            showActionSheet = true
                        }
                        .actionSheet(isPresented: $showActionSheet) {
                            ActionSheet(
                                title: Text("ActionSheet Alert"),
                                message: Text("Select an option"),
                                buttons: [
                                    .default(Text("Option 1")) {},
                                    .default(Text("Option 2")) {},
                                    .cancel()
                                ]
                            )
                        }
                    }

                    ForEach(1..<100, id: \.self) { index in
                        Text("Row \(index)")
                            .id(index)
                            .font(.system(size: geometry.size.width / 25))
                    }
                }
                .listStyle(GroupedListStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

