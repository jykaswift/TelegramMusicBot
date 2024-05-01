//
//  File.swift
//  
//
//  Created by Евгений Борисов on 01.05.2024.
//

import Vapor
import TelegramVaporBot

final class TelegramController: RouteCollection {

    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.post("telegramWebHook", use: telegramWebHook)
    }
}

extension TelegramController {

    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        return try await TGBOT.connection.dispatcher.process([update])
    }
}
