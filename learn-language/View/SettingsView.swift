//
//  SettingsView.swift
//  Learn English Words&Sentences
//
//  Created by yusuf on 31.10.2024.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var themeManager: ThemeManager
    @State private var selectedTime = Date()
    @EnvironmentObject var viewModel: HelpQuestionsViewModel
    @State private var selectedLanguage = "Türkçe" // Varsayılan dil
    @State private var showAlert = false
    
    let languages = ["Türkçe", "Español"]
    enum Theme {
        case light, dark, system
    }
    
    var body: some View {
        ZStack {
            Color(themeManager.isDarkMode ? UIColor.black : UIColor(red: 1.0, green: 0.96, blue: 0.9, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    VStack {
                        Text("Theme").font(.title).fontWeight(.semibold)
                        Rectangle()
                            .frame(height: 2)
                            .frame(width: Const.width * 0.85)
                        
                        Toggle(isOn: Binding(
                            get: { themeManager.currentTheme == .dark },
                            set: {
                                if $0 {
                                    themeManager.currentTheme = .dark
                                }
                            }
                        )) {
                            Text("Dark Mode")
                                .font(.headline)
                                .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        }
                        .padding(.vertical, 5)
                        
                        Rectangle()
                            .frame(height: 0.4)
                            .frame(width: Const.width * 0.85)
                        
                        Toggle(isOn: Binding(
                            get: { themeManager.currentTheme == .light },
                            set: {
                                if $0 {
                                    themeManager.currentTheme = .light
                                }
                            }
                        )) {
                            Text("Light Mode")
                                .font(.headline)
                                .foregroundColor(themeManager.isDarkMode ? .white : .black)
                        }
                        .padding(.vertical, 5)
                    }.frame(width: Const.width * 0.9)
                    //dil seçeneği
                    VStack {
                        Text("Language").font(.title).fontWeight(.semibold)
                        Rectangle()
                            .frame(height: 2)
                            .frame(width: Const.width * 0.85)
                        
                        Picker("Select Language", selection: $selectedLanguage) {
                            ForEach(languages, id: \.self) { language in
                                Text(language)
                                    .tag(language)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.vertical, 10)
                        .onChange(of: selectedLanguage) { newLanguage in
                            viewModel.selectedLanguage = newLanguage // ViewModel'a kaydet
                        }
                    }
                    .frame(width: Const.width * 0.9)
                    
                    
                    
                    VStack {
                        Text("Notification Time")
                            .font(.title).fontWeight(.semibold)
                        Rectangle()
                            .frame(height: 2)
                            .frame(width: Const.width * 0.85)
                        
                        DatePicker("Saat Seç", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                        
                        Button(action: {
                            requestNotificationPermission()
                            scheduleNotification(for: selectedTime)
                            showAlert = true
                        }) {
                            Text("Set Notification")
                                .foregroundColor(themeManager.isDarkMode ? .white : .black)
                                .fontWeight(.bold)
                                .frame(width: Const.width * 0.9, height: Const.height * 0.07)
                                .background(themeManager.isDarkMode ? Color(UIColor(hex : "#06402b")) : Color.brown.opacity(0.3))
                                .cornerRadius(20)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Bildirim Ayarlandı"),
                                message: Text("Seçtiğiniz saatte günlük olarak bildirim alacaksınız."),
                                dismissButton: .default(Text("Tamam"))
                            )
                        }
                    }
                    .padding()
                }.navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(themeManager.isDarkMode ? .white : .black)
                                    Text("Back")
                                        .font(Font.custom("FugazOne-Regular", size: 18))
                                        .foregroundColor(themeManager.isDarkMode ? .white : .black)
                                }
                            }
                        }
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
        .environmentObject(HelpQuestionsViewModel())
    }
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Bildirim izni hatası: \(error.localizedDescription)")
            } else {
                print("İzin verildi: \(granted)")
            }
        }
    }
    
    func scheduleNotification(for date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Daily vocabulary and sentence study time!!"
        content.sound = .defaultCritical
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Bildirim eklenirken hata oluştu: \(error.localizedDescription)")
            } else {
                print("Bildirim başarıyla ayarlandı!")
            }
        }
    }
}

#Preview {
    NavigationView {
        SettingsView()
            .environmentObject(ThemeManager())
    }
}
