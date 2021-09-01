//
//  DroidInput.swift
//  Droid
//
//  Created by JiaChen(: on 1/9/21.
//

import Foundation

public class DroidInput {
    var rawInput: UInt8 = 0 {
        didSet {
            if oldValue != rawInput {
                onChange?()
            }
            
            if (oldValue < 128 && rawInput > 128) || (oldValue > 128 && rawInput < 128) {
                onStateChange?()
            }
        }
    }
    var onChange: (() -> Void)?
    var onStateChange: (() -> Void)?
    
    public var isOn: Bool {
        return rawInput > 128
    }
    
    public var value: Double {
        return Double(rawInput) / 255
    }
    
    public func onValueChange(_ action: (() -> Void)?) {
        onChange = action
    }
    
    public func onStateChange(_ action: (() -> Void)?) {
        onStateChange = action
    }
}
