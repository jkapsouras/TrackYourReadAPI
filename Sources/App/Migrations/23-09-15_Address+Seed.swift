//
//  File.swift
//  
//
//  Created by Apprecot on 15/9/23.
//

import FluentKit

extension Address {
	struct Seed: AsyncMigration {
		func prepare(on database: Database) async throws {
			let tmp1 = UUID(uuidString: "25e50b15-4af7-4c92-9bff-b5add9a06dda") ?? UUID()
			print(tmp1.uuidString)
			let tmp2 = UUID(uuidString: "34a2fadb-fb5c-4a6f-91b9-7020b2479454") ?? UUID()
			print(tmp2.uuidString)
			let tmp3 = UUID(uuidString: "60ea7cf8-ba6a-4027-81f6-ab6193ded022") ?? UUID()
			print(tmp3.uuidString)
			// 1
			let addresses: [Address] = [
				.init(streetName: "Iπποκράτους", streetNumber: "118", city: "Αθήνα", country: "Ελλάδα", postCode: "11472", editorId:  tmp1),
				.init(streetName: "Παναγή Τσαλδάρη", streetNumber: "38", city: "Αθήνα", country: "Ελλάδα", postCode: "10437", editorId:  tmp2),
				.init(streetName: "Αγ. Παρασκευής ", streetNumber: "40", city: "Περιστέρι", country: "Ελλάδα", postCode: "12132", editorId:  tmp3)
			]
			
			
			// 2
//			_ = addresses.map { address in
//				address.save(on: database)
//			}
			
		}
		
		func revert(on database: Database) async throws {
			// 3
			return try await Address.query(on: database).delete()
		}
	}
}

