//
//  File.swift
//  
//
//  Created by Ioannis Kapsouras on 1/9/23.
//

import FluentKit

extension Editor {
	struct Seed: AsyncMigration {
		func prepare(on database: Database) async throws {
				// 1
			let editors: [Editor] = [
				.init(name: "Μεταίχμιο", imageUrl: nil),
				.init(name: "Παττάκη", imageUrl: nil),
				.init(name: "Διόπτρα", imageUrl: nil)
			]
			
				// 2
			_ = editors.map { editor in
				editor.save(on: database)
			}.compactMap{ _ in
				print(editors[0].id!)
				let addresses: [Address] = [
					.init(streetName: "Iπποκράτους", streetNumber: "118", city: "Αθήνα", country: "Ελλάδα", postCode: "11472", editorId:  editors[0].id!),
					.init(streetName: "Παναγή Τσαλδάρη", streetNumber: "38", city: "Αθήνα", country: "Ελλάδα", postCode: "10437", editorId:  editors[1].id!),
					.init(streetName: "Αγ. Παρασκευής ", streetNumber: "40", city: "Περιστέρι", country: "Ελλάδα", postCode: "12132", editorId:  editors[2].id!)
				]
				_ = addresses.map { address in
					address.save(on: database)
				}
			}
			
//			_ = editors.map{editor in
//				editor.save(on: database)
//					.map { _ in
//						Address(streetName: "Iπποκράτους", streetNumber: "118", city: "Αθήνα", country: "Ελλάδα", postCode: "11472", editorId:  editor.id!).save(on: database)
//					}
//			}
			
		}
		
		func revert(on database: Database) async throws {
				// 3
			return try await Editor.query(on: database).delete()
		}
	}
}
