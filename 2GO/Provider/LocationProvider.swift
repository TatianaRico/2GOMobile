//
//  LocationProvider.swift
//  2GO
//
//  Created by Mônica Marques on 10/11/19.
//  Copyright © 2019 2GO. All rights reserved.

//   let localizacao = try? newJSONDecoder().decode(Localizacao.self, from: jsonData)

import Foundation
import Alamofire

class LocationProvider{
    
    func alamofireLocation(completion: @escaping (Localizacao,Bool) -> Void ){
        
        
        let urlString: String = "https://www.eventbriteapi.com/v3/events/search/?location.address=Indore&expand=venue&token=DR4CWPA77JL3SSHXZBLD"
        
        let header = ["Authorization":"Bearer DR4CWPA77JL3SSHXZBLD"]
        
        if let url: URL = URL(string: urlString){
            Alamofire.request(url, method: .get, headers: header).responseJSON { (response) in
                if response.response?.statusCode == 200{
                    do{
                        if let data = response.data {
                            let object = try
                                JSONDecoder().decode(Localizacao.self, from: data)
                            print(object)
                        }
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
                }else {
                    print(response.result.debugDescription)
                }
            }
        }
    }
    
}
