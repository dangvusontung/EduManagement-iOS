//
//  ClassViewModel.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

class CoursesViewModel: PagingViewModel<Course> {
    
    @ObservationIgnored
    private let getCoursesUseCase: any GetCoursesUseCase
    
    var searchText = ""
    
    init(getCoursesUseCase: any GetCoursesUseCase) {
        self.getCoursesUseCase = getCoursesUseCase
        super.init()
    }
    
    override func loadItems() async throws -> [Course] {
        let params = GetCoursesParam()
        return try await getCoursesUseCase.execute(input: params)
    }
}
