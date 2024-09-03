//
//  BaseViewModel.swift
//  EduManager
//
//  Created by TungDVS on 01/09/2024.
//

import Foundation

@Observable
class BaseViewModel {
    var state: ViewModelState = .idle

    @ObservationIgnored
    private var tasks: [String: Task<Void, Never>] = [:]

    func startTask(identifier: String, task: @escaping () async throws -> Void) {
        cancelTask(identifier: identifier)
        let newTask = Task {
            do {
                try await task()
                self.state = .idle
            } catch {
                await MainActor.run {
                    self.state = .failure(error)
                }
            }
        }
        tasks[identifier] = newTask
    }

    func cancelTask(identifier: String) {
        tasks[identifier]?.cancel()
        tasks[identifier] = nil
    }

    func cancelAllTasks() {
        tasks.values.forEach { $0.cancel() }
        tasks.removeAll()
    }

    deinit {
        cancelAllTasks()
    }
}
