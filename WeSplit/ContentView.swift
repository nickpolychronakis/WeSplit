//
//  ContentView.swift
//  WeSplit
//
//  Created by NICK POLYCHRONAKIS on 8/10/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercenages = [10,15,20,25,0]
    
    var peopleCount: Int {
        
        return Int(numberOfPeople) ?? 0
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercenages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let amountPerPerson = grandTotal / Double(peopleCount)
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercenages.count) {
                            Text("\(self.tipPercenages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total amount")) {
                    Text("$\(self.grandTotal, specifier: "%.2f")")
                }
                Section(header: Text("Amound per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
