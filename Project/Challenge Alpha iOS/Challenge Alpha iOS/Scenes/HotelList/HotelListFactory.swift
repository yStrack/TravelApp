//
//  HotelListFactory.swift
//  Challenge Alpha iOS
//
//  Created by Yuri Strack on 19/01/23.
//

import Foundation

enum HotelListFactory {
    static func build() -> HotelListHostingController {
        let interactor = HotelListInteractor()
        let router = HotelListRouter()
        let viewModel = HotelListViewModel(interactor: interactor, router: router)
        let rootView = HotelListView(viewModel: viewModel)
        let viewController = HotelListHostingController(viewModel: viewModel, rootView: rootView)
        
        router.viewController = viewController
        
        return viewController
    }
}
