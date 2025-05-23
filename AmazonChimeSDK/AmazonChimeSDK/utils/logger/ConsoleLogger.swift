//
//  ConsoleLogger.swift
//  AmazonChimeSDK
//
//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0
//

import Foundation
import os

/// ConsoleLogger writes logs with console.
///
/// ```
/// // working with the ConsoleLogger
/// let logger = new ConsoleLogger("demo"); //default level is LogLevel.INFO
/// logger.info("info");
/// logger.debug("debug");
/// logger.fault("fault");
/// logger.error("error");
///
/// // setting logging levels
/// let logger = new ConsoleLogger("demo", .INFO);
/// logger.debug("debug"); // does not print
/// logger.setLogLevel(LogLevel.DEBUG)
/// logger.debug("debug"); // print
/// ```
@objcMembers public class ConsoleLogger: NSObject, AWSChimeLogger {
    let name: String
    var level: LogLevel

    public init(name: String, level: LogLevel = .INFO) {
        self.name = name
        self.level = level
    }

    public func `default`(msg: String) {
        log(type: .DEFAULT, msg: msg)
    }

    public func debug(debugFunction: () -> String) {
        log(type: .DEBUG, msg: debugFunction())
    }

    public func info(msg: String) {
        log(type: .INFO, msg: msg)
    }

    public func fault(msg: String) {
        log(type: .FAULT, msg: msg)
    }

    public func error(msg: String) {
        log(type: .ERROR, msg: msg)
    }

    public func setLogLevel(level: LogLevel) {
        self.level = level
    }

    public func getLogLevel() -> LogLevel {
        return level
    }

    private func log(type: LogLevel, msg: String) {
        if type.rawValue < level.rawValue {
            return
        }

        let logMessage = "[\(LogLevel.allCases[type.rawValue])] \(self.name) - " + msg

        switch type {
        case .DEFAULT:
            os_log("%@ %@", type: .default, logMessage, "Thread: \(Thread.current)")
        case .DEBUG:
            os_log("%@ %@", type: .debug, logMessage, "Thread: \(Thread.current)")
        case .INFO:
            os_log("%@ %@", type: .info, logMessage, "Thread: \(Thread.current)")
        case .FAULT:
            os_log("%@ %@", type: .fault, logMessage, "Thread: \(Thread.current)")
        case .ERROR:
            os_log("%@ %@", type: .error, logMessage, "Thread: \(Thread.current)")
        default:
            return
        }
    }
}
