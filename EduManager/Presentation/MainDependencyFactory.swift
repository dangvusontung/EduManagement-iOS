//
//  MainDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct MainDependencyFactory {
    func makeMoreViewModel() -> MoreViewModel {
#if XCODE_RUNNING_FOR_PREVIEWS
// code for Xcode Previews here
        let factory = MoreUseCaseFactoryPreview()
        return MoreViewModel(factory: factory)
#else
// code for other environments here
        let factory = MoreUseCaseFactoryImpl()
        return MoreViewModel(factory: factory)
#endif
    }
}
