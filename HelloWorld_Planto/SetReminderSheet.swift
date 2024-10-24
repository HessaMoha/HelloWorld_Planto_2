//
//  SetReminderSheet.swift
//  HelloWorld_Planto
//
//  Created by حصه العجالين on 19/04/1446 AH.
//

import SwiftUI

struct SetReminderSheet: View {
    
    
    @State private var plantName:String = ""
    @State private var selectedRoom="Bedroom"
    @State private var selectedLight = "Full sun"
    @State private var selectedWateringDays = "Every day"
    @State private var selectedWaterAmount = "20-50 ml"
    @Environment(\.presentationMode) var presentationMode // To close the sheet
    
    let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full sun", "Partial sun", "Low light"]
    let wateringDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    var body: some View {
        NavigationView{
            
            VStack{
                Form{
                    Section{
                        HStack{
                            Text("Plant Name").foregroundColor(.white)
                            TextField("Pothos", text: $plantName)
                                .foregroundColor(plantName.isEmpty ? .gray : .white)
                                .tint(Color("greenbtn"))
                        }
                    }
                    
                    Section{
                        HStack{
                            Label("Room", systemImage: "location")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ",selection: $selectedRoom){
                                ForEach(rooms, id:\.self){
                                    room in Text(room)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        HStack{
                            Label("Light", systemImage: "sun.max")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ",selection: $selectedLight){
                                ForEach(lightOptions, id:\.self){
                                    light in Text(light)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                    }
                    
                    Section{
                        HStack{
                            Label("WateringDays", systemImage: "drop")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ",selection: $selectedWateringDays){
                                ForEach(wateringDaysOptions, id:\.self){
                                    day in Text(day)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        HStack{
                            Label("Water", systemImage: "drop")
                                .foregroundColor(.white)
                            Spacer()
                            Picker(" ",selection: $selectedWaterAmount){
                                ForEach(waterAmounts, id:\.self){
                                    amount in Text(amount)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                    }
                    
                }
                
                .accentColor(.gray)// the menu cell color
                
                .navigationBarTitle("Set Reminder", displayMode: .inline)
                
                .navigationBarItems(leading: Button("Cancel", action: {self.presentationMode.wrappedValue.dismiss() // Dismisses the sheet
                                }).foregroundColor(Color("greenbtn")), trailing: Button("Save", action: {
                                    saveReminder()
                                    self.presentationMode.wrappedValue.dismiss() // Dismisses the sheet after saving
                                }).foregroundColor(Color("greenbtn")))
                
            }
        }
    }
    
    private func saveReminder(){
        
        let reminder = Reminder(plantName: plantName, room: selectedRoom, light: selectedLight, wateringDays: selectedWateringDays, waterAmount: selectedWaterAmount)
        ReminderStore.shared.addReminder(reminder)
    }
    
}

struct Reminder: Identifiable{
    var id = UUID()
    var plantName: String
    var room: String
    var light: String
    var wateringDays: String
    var waterAmount: String
    
}

class ReminderStore: ObservableObject{
    static let shared = ReminderStore()
    @Published var reminders: [Reminder] = []
    @Published var selectedReminderIds: Set<UUID> = []
    
    private init(){}
    
    func addReminder(_ reminder: Reminder){
        reminders.append(reminder)
        print("Reminder saved: \(reminder)")
    }
}



#Preview {
    SetReminderSheet()
}
