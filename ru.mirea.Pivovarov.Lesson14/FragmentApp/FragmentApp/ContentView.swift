//
//  ContentView.swift
//  FragmentApp
//
//  Created by Никита Пивоваров on 14.12.2024.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(id: 1, title: "Сделать домашнее задание", isCompleted: false),
        Task(id: 2, title: "Прочитать книгу", isCompleted: false),
        Task(id: 3, title: "Посетить тренажерный зал", isCompleted: true)
    ]
    @State private var selectedTask: Task?
    
    var body: some View {
        NavigationSplitView {
            List(tasks, selection: $selectedTask) { task in
                NavigationLink(value: task) {
                    Text(task.title)
                }
                .padding()
            }
            .navigationTitle("Список дел")
        } detail: {
            if let selectedTask {
                TaskDetailView(task: selectedTask)
                    .id(selectedTask.id)
                    .environment(\.studentNumber, 20)
            } else {
                Text("Выберите задачу")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Task: Identifiable, Hashable {
    let id: Int
    var title: String
    var isCompleted: Bool
}

struct TaskDetailView: View {
    @State var task: Task
    @Environment(\.studentNumber) private var studentNumber
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Студент № \(studentNumber)")
                .font(.headline)
                .foregroundColor(.secondary)
            Text(task.title)
                .font(.largeTitle)
                .bold()
            Toggle("Выполнено", isOn: $task.isCompleted)
                .padding()
            Spacer()
        }
        .padding()
        .navigationTitle("Детали задачи")
    }
}

struct StudentNumberKey: EnvironmentKey {
    static let defaultValue: Int = 0
}

extension EnvironmentValues {
    var studentNumber: Int {
        get { self[StudentNumberKey.self] }
        set { self[StudentNumberKey.self] = newValue }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
