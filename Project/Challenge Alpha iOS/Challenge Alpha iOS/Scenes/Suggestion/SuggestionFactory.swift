//
//  SuggestionFactory.swift
//  Challenge Alpha iOS
//
//  Created by Yuri Strack on 19/01/23.
//

import Foundation

enum SuggestionFactory {
    static func build(suggestionType: SuggestionType, onSearchComplete: @escaping ((String) -> Void)) -> SuggestionHostingController {
        let interactor = SuggestionInteractor()
        let router = SuggestionRouter()
        let viewModel = SuggestionViewModel(suggestionType: suggestionType, interactor: interactor, router: router, onSearchComplete: onSearchComplete)
        let view = SuggestionView(viewModel: viewModel)
        let viewController = SuggestionHostingController(rootView: view)
        
        router.viewController = viewController
        
        return viewController
    }
}
