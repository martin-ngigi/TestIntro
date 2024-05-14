//
//  DashboardView.swift
//  TestIntro
//
//  Created by Martin Wainaina on 14/05/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            TasksView()
                .tabItem {
                    VStack{
                        Text("Tasks")
                    }
                }
            
            ContentView()
                .tabItem {
                    VStack{
                        Text("Tip")
                    }
                }
        }
    }
}

#Preview {
    DashboardView()
}
