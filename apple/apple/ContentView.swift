import SwiftUI

struct DashboardView: View {
    @State private var surveyProgress: Double = 0.4
    @State private var wellBeingScore: Double = 0.75
    @State private var notifications: [String] = ["Reminder: Complete the survey", "New update on company policies"]
    
    var body: some View {
        VStack {
            // Header
            Text("Dashboard")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 16)
            
            // Overview Cards
            HStack(spacing: 16) {
                OverviewCard(title: "Employee Satisfaction", value: "85%")
                OverviewCard(title: "Average Work Hours", value: "40")
                OverviewCard(title: "Completed Surveys", value: "150")
            }
            .padding(.top, 24)
            
            // Survey Progress
            Text("Survey Progress")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            ProgressView(value: surveyProgress)
                .padding(.horizontal)
            
            // Well-being Index
            Text("Well-being Index")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            ProgressView(value: wellBeingScore)
                .padding(.horizontal)
            
            // Notifications
            Text("Notifications")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(notifications, id: \.self) { notification in
                    Text(notification)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .onAppear {
            simulateDataUpdates()
        }
    }
    
    private func simulateDataUpdates() {
        // Simulate survey progress updates
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                surveyProgress = 0.8
            }
        }
        
        // Simulate well-being score updates
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                wellBeingScore = 0.9
            }
        }
        
        // Simulate new notification
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                notifications.append("New survey available")
            }
        }
    }
}

struct OverviewCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 120, height: 120)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct SurveyResultsView: View {
    var body: some View {
        VStack {
            // Header
            Text("Survey Results")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 16)
            
            // Survey Selection
            Text("Survey Selection")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            // Survey Overview
            Text("Survey Overview")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            // Analytics
            Text("Analytics")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            // Individual Responses
            Text("Individual Responses")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Dashboard")
                }
            
            SurveyResultsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Survey Results")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
