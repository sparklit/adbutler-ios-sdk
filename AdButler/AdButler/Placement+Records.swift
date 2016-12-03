//
//  Placement+Records.swift
//  AdButler
//
//  Created by Ryuichi Saito on 11/20/16.
//  Copyright © 2016 AdButler. All rights reserved.
//

import Foundation

public extension Placement {
    public func recordImpression() {
        if let accupixelUrl = self.accupixelUrl.flatMap({ URL(string: $0) }) {
            AdButler.requestPixel(with: accupixelUrl)
        } else if let trackingPixel = self.trackingPixel.flatMap({ URL(string: $0) }) {
            AdButler.requestPixel(with: trackingPixel)
        } else {
            print("Cannot construct a valid impression URL.")
        }
    }
    
    public func recordClick() {
        if let redirectUrl = self.redirectUrl.flatMap({ URL(string: $0) }) {
            AdButler.requestPixel(with: redirectUrl)
        } else {
            print("Cannot construct a valid redirect URL.")
        }
    }
}