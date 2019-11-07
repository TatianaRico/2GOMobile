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
    
    func alamofireEvent(){
        
        let urlString: String = "https://www.eventbriteapi.com/v3/events/search/?categories=103"
        
        let header = ["Authorization":"Bearer MDJJRHWI5ZI73GCRHCMT"]
        
        if let url: URL = URL(string: urlString){
            Alamofire.request(url, method: .get, headers: header).responseJSON { (response) in
                if response.response?.statusCode == 200{
                    do{
                        if let data = response.data {
                            let object = try
                                JSONDecoder().decode(Evento.self, from: data)
                            print(object)
                        }
                    }
                    catch{
                        
                    }
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
