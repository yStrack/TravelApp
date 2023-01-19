//
//  HoteListHostingController.swift
//  Challenge Alpha iOS
//
//  Created by Yuri Strack on 19/01/23.
//

import Foundation
import UIKit
import SwiftUI

final class HotelListHostingController: UIHostingController<HotelListView> {
    
    let viewModel: HotelListViewModel
    
    init(viewModel: HotelListViewModel, rootView: HotelListView) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBarAppearance()
    }
    
    // MARK: Navigation Bar setup
    private func setupNavigationBarItems() {
        let rightBarItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain, target: self.viewModel,
            action: #selector(viewModel.onSearchTap)
        )
        
        self.navigationItem.rightBarButtonItem = rightBarItem
        self.navigationItem.title = "Hoteis"
    }
    
    private func setupNavigationBarAppearance() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.backgroundEffect = .none
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}