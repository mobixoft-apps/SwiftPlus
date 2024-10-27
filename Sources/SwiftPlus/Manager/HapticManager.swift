//
//  File.swift
//  SwiftPlus
//
//  Created by Yusuf Uzan on 27.10.2024.
//

import SwiftUI

// MARK: - Haptic Types
enum HapticType {
    case impact(UIImpactFeedbackGenerator.FeedbackStyle)
    case notification(UINotificationFeedbackGenerator.FeedbackType)
    case selection
}

// MARK: - Haptic Manager
final class HapticManager {
    static let shared = HapticManager()
    
    private var impactGenerator: UIImpactFeedbackGenerator?
    private var notificationGenerator: UINotificationFeedbackGenerator?
    private var selectionGenerator: UISelectionFeedbackGenerator?
    
    private init() {}
    
    func prepare(_ type: HapticType) {
        switch type {
        case .impact(let style):
            impactGenerator = UIImpactFeedbackGenerator(style: style)
            impactGenerator?.prepare()
        case .notification:
            notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator?.prepare()
        case .selection:
            selectionGenerator = UISelectionFeedbackGenerator()
            selectionGenerator?.prepare()
        }
    }
    
    func generate(_ type: HapticType) {
        switch type {
        case .impact(let style):
            let generator = impactGenerator ?? UIImpactFeedbackGenerator(style: style)
            generator.impactOccurred()
            
        case .notification(let type):
            let generator = notificationGenerator ?? UINotificationFeedbackGenerator()
            generator.notificationOccurred(type)
            
        case .selection:
            let generator = selectionGenerator ?? UISelectionFeedbackGenerator()
            generator.selectionChanged()
        }
    }
}

// MARK: - View Extension
extension View {
    func haptic(_ type: HapticType) {
        HapticManager.shared.generate(type)
    }
    
    func prepareHaptic(_ type: HapticType) {
        HapticManager.shared.prepare(type)
    }
    
    // SwiftUI için özel modifier
    func onTapHaptic(_ type: HapticType) -> some View {
        self.onTapGesture {
            HapticManager.shared.generate(type)
        }
    }
    
    // Gesture modifier ile kullanım için
    func simultaneousHaptic(_ type: HapticType) -> some View {
        self.simultaneousGesture(TapGesture().onEnded { _ in
            HapticManager.shared.generate(type)
        })
    }
}
