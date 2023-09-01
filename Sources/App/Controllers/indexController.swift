//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 30/8/23.
//

import Vapor

final class IndexController {
	
	struct IndexContext: Encodable {
		let name: String
	}
	
	func getIndex(request: Request) async throws -> View {
		return try await request.view.render("index", IndexContext(name: "Vapor"))
	}
}
	
extension IndexController: RouteCollection {
	
		// 5
	func boot(routes: RoutesBuilder) throws {
		routes.get("index", use: getIndex)
	}
}



