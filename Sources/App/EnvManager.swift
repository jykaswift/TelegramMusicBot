//
//  File.swift
//  
//
//  Created by Евгений Борисов on 01.05.2024.
//

import Foundation

class EnvManager {
    static func getValue(with key: String) -> String {
        let env = ProcessInfo.processInfo.environment

        let value = env[key] ?? "trace"

        return value
    }
}
