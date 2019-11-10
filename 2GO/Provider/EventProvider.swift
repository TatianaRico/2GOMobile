//
//  EventProvider.swift
//  2GO
//
//  Created by Tatiana Rico on 07/11/19.
//  Copyright © 2019 2GO. All rights reserved.
//

import Foundation
import Alamofire

class EventProvider{
    
    func alamofireEvent(id: String, completion: @escaping (Evento?,Bool) -> Void ){
        
        let urlString: String = "https://www.eventbriteapi.com/v3/events/search/"
        
        let parametro = ["categories" : id]
        let header = ["Authorization":"Bearer MDJJRHWI5ZI73GCRHCMT"]
        
        if let url: URL = URL(string: urlString){
            Alamofire.request(url, method: .get, parameters: parametro, headers: header).responseJSON { (response) in
                if response.response?.statusCode == 200{
                    do{
                        if let data = response.data {
                            let object = try
                                JSONDecoder().decode(Evento.self, from: data)
                            print(object)
                            completion(object, true)
                        } else {
                            completion(nil, false)
                        }
                    }
                    catch{
                        completion(nil, false)
                    }
                } else {
                    completion(nil, false)
                }
            }
        }
    }
    
    func requestCategory( completion: @escaping (Categoria) -> Void){
         
         let urlString: String = "https://www.eventbriteapi.com/v3/categories/"
         
         let header = ["Authorization":"Bearer MDJJRHWI5ZI73GCRHCMT"]
         
         if let url: URL = URL(string: urlString){
             Alamofire.request(url, method: .get, headers: header).responseJSON { (response) in
                 if response.response?.statusCode == 200{
                     do{
                         if let data = response.data {
                             let object = try
                                 JSONDecoder().decode(Categoria.self, from: data)
                             print(object)
                            
                            completion(object)
                         }
                     }
                     catch{
                         
                     }
                 }
             }
         }
     }
    
}
