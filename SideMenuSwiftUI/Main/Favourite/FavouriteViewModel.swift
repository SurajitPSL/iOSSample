//
//  FavouriteViewModel.swift
//  SideMenuSwiftUI
//
//  Created by Surajit Dhara on 27/11/23.
//

import Foundation

class FavouriteViewModel: ObservableObject {
    
    @Published var fetchedProducts: ProductDetails!
    init(){
        getUserData()
    }
    
    private func getUserData(){
        
        NetworkManager.sharedManager.requestApi(API: APIs.products) { result in
            switch result {
               case .success(let data):
                //
                do {
                    let decoder = JSONDecoder()
                    let messages = try decoder.decode(ProductDetails.self, from: data)
                    print(messages as Any)
                } catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key - '\(key)' not found:-", context.debugDescription)
                    print("\n codingPath:-", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("\n\n Value - '\(value)' not found:", context.debugDescription)
                    print("\n codingPath:--", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("\n\n Type '\(type)' mismatch:", context.debugDescription)
                    print("\n codingPath:---", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
                
                //
                let fetchedProducts = try? JSONDecoder().decode(ProductDetails.self, from: data)
                self.fetchedProducts =  fetchedProducts!
                print("The assigned => \(String(describing: self.fetchedProducts))")
               case .failure(let error):
                   print(error.localizedDescription)
               }
        }
    }
}
