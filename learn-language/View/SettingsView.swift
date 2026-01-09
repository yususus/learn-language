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
    @State private var selectedLanguage = "Türkçe"
    @State private var showAlert = false
    
    let languages = ["Türkçe", "Español"]
    
    var body: some View {
        ZStack {
            // Modern gradient background
            LinearGradient(
                colors: themeManager.isDarkMode ? 
                    [Color(hex: "#0a0a0a"), Color(hex: "#1a1a2e")] :
                    [Color(hex: "#f8f9fa"), Color(hex: "#e9ecef")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    // Theme Section
                    SettingsSection(title: "Theme", icon: "paintbrush.fill") {
                        VStack(spacing: 16) {
                            // Dark Mode Toggle
                            SettingsToggleRow(
                                icon: "moon.fill",
                                title: "Dark Mode",
                                isOn: Binding(
                                    get: { themeManager.currentTheme == .dark },
                                    set: {
                                        if $0 {
                                            themeManager.currentTheme = .dark
                                        }
                                    }
                                ),
                                themeManager: themeManager
                            )
                            
                            Divider()
                                .background(themeManager.isDarkMode ? Color(hex: "#2d3436") : Color.gray.opacity(0.2))
                            
                            // Light Mode Toggle
                            SettingsToggleRow(
                                icon: "sun.max.fill",
                                title: "Light Mode",
                                isOn: Binding(
                                    get: { themeManager.currentTheme == .light },
                                    set: {
                                        if $0 {
                                            themeManager.currentTheme = .light
                                        }
                                    }
                                ),
                                themeManager: themeManager
                            )
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(themeManager.isDarkMode ? Color(hex: "#1e1e2e") : Color.white)
                                .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 5)
                        )
                    }
                    
                    // Language Section
                    SettingsSection(title: "Language", icon: "globe") {
                        VStack(spacing: 16) {
                            Picker("Select Language", selection: $selectedLanguage) {
                                ForEach(languages, id: \.self) { language in
                                    Text(language)
                                        .tag(language)
                                }
                            }
                            .pickerStyle(.segmented)
                            .onChange(of: selectedLanguage) { newLanguage in
                                viewModel.selectedLanguage = newLanguage
                            }
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(themeManager.isDarkMode ? Color(hex: "#1e1e2e") : Color.white)
                                .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 5)
                        )
                    }
                    
                    // Notification Section
                    SettingsSection(title: "Notifications", icon: "bell.fill") {
                        VStack(spacing: 20) {
                            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                                .colorScheme(themeManager.isDarkMode ? .dark : .light)
                            
                            Button(action: {
                                requestNotificationPermission()
                                scheduleNotification(for: selectedTime)
                                showAlert = true
                            }) {
                                HStack {
                                    Image(systemName: "bell.badge.fill")
                                    Text("Set Notification")
                                        .fontWeight(.semibold)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(
                                    LinearGradient(
                                        colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(16)
                                .shadow(color: Color(hex: "#667eea").opacity(0.4), radius: 15, x: 0, y: 8)
                            }
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(themeManager.isDarkMode ? Color(hex: "#1e1e2e") : Color.white)
                                .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 5)
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Back")
                            .font(Font.custom("FugazOne-Regular", size: 18))
                    }
                    .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(themeManager.isDarkMode ? Color(hex: "#2d3436") : Color.white)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    )
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Notification Set"),
                message: Text("You will receive daily notifications at the selected time."),
                dismissButton: .default(Text("OK"))
            )
        }
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
        .environmentObject(HelpQuestionsViewModel())
        .onAppear {
            selectedLanguage = viewModel.selectedLanguage
        }
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

// Helper Views for Settings
struct SettingsSection<Content: View>: View {
    let title: String
    let icon: String
    let content: Content
    @EnvironmentObject var themeManager: ThemeManager
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(themeManager.isDarkMode ? Color(hex: "#667eea") : Color(hex: "#4facfe"))
                
                Text(title)
                    .font(Font.custom("FugazOne-Regular", size: 24))
                    .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
            }
            .padding(.horizontal, 4)
            
            content
        }
    }
}

struct SettingsToggleRow: View {
    let icon: String
    let title: String
    @Binding var isOn: Bool
    @ObservedObject var themeManager: ThemeManager
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(themeManager.isDarkMode ? Color(hex: "#667eea") : Color(hex: "#4facfe"))
                .frame(width: 30)
            
            Text(title)
                .font(.headline)
                .foregroundColor(themeManager.isDarkMode ? .white : Color(hex: "#2d3436"))
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
    }
}

#Preview {
    NavigationView {
        SettingsView()
            .environmentObject(ThemeManager())
    }
}
