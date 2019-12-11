//
//  HomeController.swift
//  2GO
//
//  Created by Tatiana Rico on 04/12/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import Foundation

class HomeController{
    let event  = EventProvider()
    
    private var categoria: Localizacao?
    
    func getEvent(completion: @escaping (Bool) -> Void){
        event.alamofireEvent { (event, success) in
            if success {
                self.categoria = event
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func  numberOfItemsInSection() -> Int{
        categoria?.businesses.count ?? 0
    }
    
    func getItemByIndex(indexPath: IndexPath) -> Business {
        return categoria?.businesses[indexPath.row] ?? Business(id: "", alias: "", name: "", imageURL: "", isClosed: false, url: "", reviewCount: 0, categories: [], rating: 0.0, coordinates: Center(latitude: 0.0, longitude: 0.0), transactions: [], price: "", location: Location(address1: "", address2: nil, address3: nil, city: City(rawValue: "")!, zipCode: "", country: Country(rawValue: "")!, state: State(rawValue: "")!, displayAddress: []), phone: "", displayPhone: "", distance: 0)
    }
}
