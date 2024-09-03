//
//  PagingViewModel.swift
//  EduManager
//
//  Created by TungDVS on 01/09/2024.
//

import Foundation

class PagingViewModel<T: Identifiable>: BaseViewModel {
    var currentPage: Int = 0
    var itemsPerPage: Int = 20
    var isLoadingMore: Bool = false
    var shouldLoadMore: Bool = true
    var items: [T] = []
    
    override init() {
        super.init()
        loadOnStart()
    }
    
    func loadOnStart() {
        startTask(identifier: TaskIdentifier.loadOnStart) { [weak self] in
            guard let self = self else { return }
            let items = try await self.loadItems()
            await self.handleLoadItemsSuccess(items, loadMore: false)
        }
    }
    
    func loadMore() {
        self.isLoadingMore = true
        startTask(identifier: TaskIdentifier.loadMore) { [weak self] in
            guard let self = self else { return }
            let items = try await self.loadItems()
            await self.handleLoadItemsSuccess(items, loadMore: true)
        }
    }

    open func loadItems() async throws -> [T] {
        fatalError("loadItems() must be overridden")
    }

    func refresh() async throws {
        resetPagination()
        loadOnStart()
    }

    @MainActor
    func handleLoadItemsSuccess(_ items: [T], loadMore: Bool = false) {
        print("Load item success: items count = \(items.count)")
        state = .idle
        shouldLoadMore = items.count == itemsPerPage
        if shouldLoadMore {
            currentPage += 1
        }

        isLoadingMore = false
        self.items = loadMore ? self.items + items : items
    }

    func resetPagination() {
        currentPage = 0
        isLoadingMore = false
        cancelTask(identifier: "pagination")
    }
}
