//
//  AddTasksView.swift
//  TestIntro
//
//  Created by Martin Wainaina on 14/05/2024.
//

import SwiftUI

struct AddTasksView: View {
    @Binding var taskName: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
                .accessibility(identifier: "addTaskButton")

            }
            TextField("Task Name", text: $taskName)
                .textFieldStyle(.roundedBorder)
                .accessibility(identifier: "addTaskTextField")
            Spacer()
        }
        .navigationTitle("Add Task")
        .padding()
    }
}

#Preview {
    AddTasksView(taskName: .constant("Sample title"))
}
