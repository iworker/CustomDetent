//
//  CustomDetent.swift
//
//  Created by ivan on 27.02.2023.
//

import Foundation
import UISheetPresentationControllerDetent
import UIKit

public enum Detent: Hashable {
    case medium
    case large
    case height(_ constant: CGFloat)
}

public extension Detent {
    init?(id: UISheetPresentationController.Detent.Identifier) {
        switch id {
        case .medium:
            self = .medium
            
        case .large:
            self = .large
            
        default:
            if let number = NumberFormatter().number(from: id.rawValue) {
                let value = CGFloat(truncating: number)
                self = .height(value)
            } else {
                return nil
            }
        }
    }
    
    var id: UISheetPresentationController.Detent.Identifier {
        switch self {
        case .medium:
            return .medium

        case .large:
            return .large

        case let .height(value):
            return .init(value.description)
        }
    }

    var system: UISheetPresentationController.Detent {
        switch self {
        case .medium:
            return .medium()

        case .large:
            return .large()

        case let .height(constant):
            if #available(iOS 16.0, *) {
                return .custom(identifier: id, resolver: {_ in constant})
            } else {
                return ._detent(withIdentifier: id.rawValue, constant: constant)
            }
        }
    }
}
