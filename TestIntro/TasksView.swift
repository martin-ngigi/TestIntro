//
//  TasksView.swift
//  TestIntro
//
//  Created by Martin Wainaina on 14/05/2024.
//

import SwiftUI

struct TasksView: View {
    @State private var taskName: String = ""
    @State private var tasks: [String] = []
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                List(tasks, id: \.self) { name in
                    Text(name)
                }
                .accessibility(identifier: "taskList")
            }.sheet(isPresented: $isPresented, onDismiss: {
                tasks.append(taskName)
                taskName = ""
            }, content:  {
                
                AddTasksView(taskName: $taskName)
                
            })
            .navigationTitle("Add Tasks")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    .accessibility(identifier: "showAddTaskButton")
                    
                }
            }
        }
    }
}

#Preview {
    TasksView()
}
