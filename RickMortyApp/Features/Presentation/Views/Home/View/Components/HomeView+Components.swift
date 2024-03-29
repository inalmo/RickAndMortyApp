//
//  HomeView+Components.swift
//  RickMortyApp
//
//  Created by Iñigo Alonso Molledo on 29/2/24.
//

import SwiftUI

extension HomeView {
    var scrollView: some View {
        ScrollView() {
            scrollDetectionView
            characterListView
                .padding(.vertical, 70)
                .padding(.bottom, 50)
        }.coordinateSpace(.named("scroll"))
    }
    
    var scrollDetectionView: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                let estimatedContentHeight = CGFloat(viewModel.characterList.count * 100)
                let threshold = 0.8 * estimatedContentHeight
                if value <= -threshold {
                    Task {
                        await viewModel.loadCharacterList()
                    }
                }
                if value < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }

    var characterListView: some View {
        VStack(spacing: 16) {
            ForEach(Array(viewModel.characterList.enumerated()), id: \.offset) { index, businessModel in
                SectionRowView(section: SectionRowModel(businessModel: businessModel))
                    .onTapGesture {
                        selectedCharacter = businessModel
                        showDetail = true
                    }
                if index == viewModel.characterList.count - 1 {
                    Divider()
                    if viewModel.isLoading {
                        ProgressView("Loading more characters...")
                            .accentColor(.white)
                    }
                } else {
                    Divider()
                }
            }
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}
