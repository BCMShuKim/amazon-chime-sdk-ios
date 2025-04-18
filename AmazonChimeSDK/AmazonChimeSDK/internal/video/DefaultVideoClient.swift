//
//  DefaultVideoClient.swift
//  AmazonChimeSDK
//
//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0
//

import AmazonChimeSDKMedia
import Foundation

class DefaultVideoClient: VideoClient {
    private let logger: AWSChimeLogger

    init(logger: AWSChimeLogger) {
        self.logger = logger

        super.init()
    }

    override func videoLogCallBack(_ logLevel: video_client_loglevel_t, msg: String?) {
        guard let msg = msg else { return }
        switch logLevel.rawValue {
        case Constants.errorLevel, Constants.fatalLevel:
            logger.error(msg: msg)
        default:
            logger.default(msg: msg)
        }
    }
}
