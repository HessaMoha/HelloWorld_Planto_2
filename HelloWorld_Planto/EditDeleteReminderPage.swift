import SwiftUI

struct EditDeleteReminderPage: View {
    @Binding var reminder: Reminder
    @Environment(\.presentationMode) var presentationMode // To close the page
    @ObservedObject var reminderStore = ReminderStore.shared
    
    @State private var plantName: String
    @State private var selectedRoom: String
    @State private var selectedLight: String
    @State private var selectedWateringDays: String
    @State private var selectedWaterAmount: String
    
    let rooms = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full sun", "Partial sun", "Low light"]
    let wateringDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    init(reminder: Binding<Reminder>) {
        _reminder = reminder
        _plantName = State(initialValue: reminder.wrappedValue.plantName)
        _selectedRoom = State(initialValue: reminder.wrappedValue.room)
        _selectedLight = State(initialValue: reminder.wrappedValue.light)
        _selectedWateringDays = State(initialValue: reminder.wrappedValue.wateringDays)
        _selectedWaterAmount = State(initialValue: reminder.wrappedValue.waterAmount)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Plant Name")
                                .foregroundColor(.white)
                            TextField("Plant Name", text: $plantName)
                                .foregroundColor(plantName.isEmpty ? .gray : .white)
                                .tint(Color("greenbtn"))
                        }
                    }
                    
                    Section {
                        HStack {
                            Label("Room", systemImage: "location").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedRoom) {
                                ForEach(rooms, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        HStack {
                            Label("Light", systemImage: "sun.max").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedLight) {
                                ForEach(lightOptions, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                    Section {
                        HStack {
                            Label("Watering Days", systemImage: "drop").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedWateringDays) {
                                ForEach(wateringDaysOptions, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        HStack {
                            Label("Water Amount", systemImage: "drop").foregroundColor(.white)
                            Spacer()
                            Picker(" ", selection: $selectedWaterAmount) {
                                ForEach(waterAmounts, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                }
                .accentColor(.gray) // the menu cell color
                .navigationBarTitle("Edit Reminder", displayMode: .inline)
                .navigationBarItems(
                    leading: Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss() // Dismisses the page
                    }
                    .foregroundColor(Color("greenbtn")),
                    trailing: Button("Save") {
                        saveChanges()
                        self.presentationMode.wrappedValue.dismiss() // Dismisses the page after saving
                    }
                    .foregroundColor(Color("greenbtn"))
                )
                
                // Centered Delete Button
                Button(action: {
                    deleteReminder()
                }) {
                    Text("Delete Reminder")
                        
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.red)
                        .padding()
                        .background(Color("graybtn"))
                        .cornerRadius(10)
                        
                    
                }
                .padding(.top, -250)
                
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
    
    private func saveChanges() {
        if let index = reminderStore.reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminderStore.reminders[index].plantName = plantName
            reminderStore.reminders[index].room = selectedRoom
            reminderStore.reminders[index].light = selectedLight
            reminderStore.reminders[index].wateringDays = selectedWateringDays
            reminderStore.reminders[index].waterAmount = selectedWaterAmount
        }
    }
    
    private func deleteReminder() {
        if let index = reminderStore.reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminderStore.reminders.remove(at: index)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    EditDeleteReminderPage()
}
