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
    
    func alamofireEvent(completion: @escaping (Localizacao?,Bool) -> Void ){
        
        let urlString: String = "https://api.yelp.com/v3/businesses/search"
        
        let parametro = ["latitude" : "-23.5475",
                        "longitude": "-46.63611"]
        
        let header = ["Authorization": "Bearer YqSrSfWceaK6CK9VU0762Z_IWjtgXz_Hf-VEtZN3KZVJff52pl2M85z0VPP0Meo3qMwWRusxKfa7roIdpS6X5rATkrXE7FnBFrMzI-my7b9mKZwbw9opQd-hvojQXXYx"]
        
        if let url: URL = URL(string: urlString){
            Alamofire.request(url, method: .get, parameters: parametro, headers: header).responseJSON { (response) in
                if response.response?.statusCode == 200{
                    
                    do{
                        if let data = response.data {
                            let object = try
                                JSONDecoder().decode(Localizacao.self, from: data)
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
    
//    func requestCategory( completion: @escaping (Categorie) -> Void){
//
//         let urlString: String = "https://www.eventbriteapi.com/v3/categories/"
//
//         let header = ["Authorization":"Bearer MDJJRHWI5ZI73GCRHCMT"]
//
//         if let url: URL = URL(string: urlString){
//             Alamofire.request(url, method: .get, headers: header).responseJSON { (response) in
//                 if response.response?.statusCode == 200{
//                     do{
//                         if let data = response.data {
//                             let object = try
//                                 JSONDecoder().decode(Categoria.self, from: data)
//                             print(object)
//
//                            completion(object)
//                         }
//                     }
//                     catch{
//
//                     }
//                 }
//             }
//         }
   //  }
    
}
