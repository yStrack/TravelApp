//
//  PackageListView.swift
//  Challenge Alpha iOS
//
//  Created by Yuri Strack on 16/01/23.
//

import SwiftUI

struct PackageListView: View {
    
    @ObservedObject var viewModel: PackageListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: UIConstants.PADDING_VALUES.NORMAL) {
                HStack {
                    Text(viewModel.query.isEmpty ? "" : "Exibindo resultados de \(viewModel.query)")
                        .font(.system(size: 12))
                        .foregroundColor(UIConstants.COLOR.hurbGray)
                    Spacer()
                }
                
                ForEach(0..<viewModel.packages.count, id: \.self) { index in
                    PackageCardView(
                        city: viewModel.packages[index].getCity(),
                        country: viewModel.packages[index].getCountry(),
                        name: viewModel.packages[index].getName(),
                        duration: viewModel.packages[index].getDuration(),
                        maxPeople: viewModel.packages[index].getMaxPeople(),
                        amount: viewModel.packages[index].getFormattedAmount(),
                        originalAmount: viewModel.packages[index].getFormattedOriginalAmount(),
                        tags: viewModel.packages[index].getTagsWithDiscount(),
                        imagesURL: viewModel.packages[index].getImagesURL(),
                        action: {
                            viewModel.onPackageTap(viewModel.packages[index])
                        }
                    )
                }
            }
            .padding()
        }
        .loading($viewModel.showLoading)
        .onChange(of: viewModel.query, perform: { newValue in
            self.viewModel.getPackages()
        })
        .onAppear {
            self.viewModel.getPackages()
        }
    }
}
