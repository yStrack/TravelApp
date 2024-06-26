//
//  HotelListView.swift
//  Challenge Alpha iOS
//
//  Created by Yuri Strack on 19/01/23.
//

import SwiftUI

struct HotelListView: View {
    
    @ObservedObject var viewModel: HotelListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: UIConstants.PADDING_VALUES.NORMAL) {
                ForEach(0..<viewModel.hotels.count, id: \.self) { index in
                    HotelCardView(
                        name: viewModel.hotels[index].getName(),
                        city: viewModel.hotels[index].getCity(),
                        country: viewModel.hotels[index].getCountry(),
                        stars: viewModel.hotels[index].getStars(),
                        amenities: viewModel.hotels[index].getAmenitiesName(),
                        amount: viewModel.hotels[index].getFormattedAmount(),
                        imagesURL: viewModel.hotels[index].getImagesURL(),
                        action: {
                            viewModel.onHotelTap(viewModel.hotels[index])
                        }
                    )
                }
            }
            .padding()
        }
        .loading($viewModel.showLoading)
        .error($viewModel.showError)
        .onAppear {
            self.viewModel.getHotelList()
        }
    }
}
