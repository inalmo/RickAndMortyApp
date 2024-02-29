//
//  ScrollPreferenceKey.swift
//  RickMortyApp
//
//  Created by Iñigo Alonso Molledo on 29/2/24.
//
import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
