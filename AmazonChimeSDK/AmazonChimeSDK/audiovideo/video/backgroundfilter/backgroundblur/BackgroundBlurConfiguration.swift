//
//  BackgroundBlurConfiguration.swift
//  AmazonChimeSDK
//
//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation

@objcMembers public class BackgroundBlurConfiguration: NSObject {
    let blurStrength: BackgroundBlurStrength
    let logger: AWSChimeLogger
    let backgroundFilterProcessor: BackgroundFilterProcessor

    public init(logger: AWSChimeLogger, blurStrength: BackgroundBlurStrength = BackgroundBlurStrength.low) {
        self.blurStrength = blurStrength
        self.logger = logger
        self.backgroundFilterProcessor = BackgroundFilterProcessor(logger: logger)
    }
}
