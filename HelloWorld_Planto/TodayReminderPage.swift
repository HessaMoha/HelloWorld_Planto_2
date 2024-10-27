import SwiftUI

struct TodayReminderPage: View {
    
    @State private var showRemindersCompleted = false
    
    @State private var showReminderSheet = false
    @State private var showEditDeleteReminderPage = false
    @ObservedObject var reminderStore = ReminderStore.shared
    @State private var selectedReminder: Reminder?

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("My Plants 🌱")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                        .background(Color.gray)
                    
                    Text("Today")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    List {
                        ForEach(reminderStore.reminders) { reminder in
                            VStack(alignment: .leading, spacing: 15) {
                                Label(reminder.room, systemImage: "location")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                HStack {
                                    Image(systemName: reminderStore.selectedReminderIds.contains(reminder.id) ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: 30))
                                        .foregroundColor(reminderStore.selectedReminderIds.contains(reminder.id) ? Color("greenbtn") : .gray)
                                        .onTapGesture {
                                            toggleReminderSelection(reminder)
                                        }
                                    
                                    Text(reminder.plantName)
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                
                                HStack {
                                    Label(reminder.light, systemImage: "sun.max")
                                        .foregroundColor(Color("yellow"))
                                    Label(reminder.waterAmount, systemImage: "drop")
                                        .foregroundColor(Color("blue"))
                                }
                            }
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedReminder = reminder
                                showEditDeleteReminderPage = true
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteReminder(reminder: reminder)
                                } label: {
                                    Label("", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.black)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            selectedReminder = nil
                            showReminderSheet = true
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 30.0, height: 60)
                                .background(Color("greenbtn"))
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        
                        Text("New Reminder")
                            .foregroundColor(Color("greenbtn"))
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                    }
                }
                .padding()
            }
            .sheet(isPresented: Binding(
                get: { showReminderSheet || showEditDeleteReminderPage },
                set: { isPresented in
                    if !isPresented {
                        showReminderSheet = false
                        showEditDeleteReminderPage = false
                    }
                }
            )) {
                if let reminder = selectedReminder {
                    EditDeleteReminderPage(reminder: .constant(reminder))
                } else {
                    SetReminderSheet()
                }
            }
        }
    }
    
    private func toggleReminderSelection(_ reminder: Reminder) {
        if reminderStore.selectedReminderIds.contains(reminder.id) {
            reminderStore.selectedReminderIds.remove(reminder.id)
        } else {
            reminderStore.selectedReminderIds.insert(reminder.id)
        }
    }

    private func deleteReminder(reminder: Reminder) {
        if let index = reminderStore.reminders.firstIndex(of: reminder) {
            reminderStore.reminders.remove(at: index)
        }
    }
}


#Preview {
    TodayReminderPage()
}
