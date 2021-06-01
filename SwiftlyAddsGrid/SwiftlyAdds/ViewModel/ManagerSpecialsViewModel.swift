//
//  ManagerSpecialsViewModel.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/27/21.
//

import Foundation

enum Result<Value, Response> {
    case success(Value, Response)
    case failure(Response, Error)
}

protocol ManagerSpecialsViewModelProtocol: AnyObject {
   
}

class ManagerSpecialsViewModel {
    
    private weak var delegate: ManagerSpecialsViewModelProtocol?
    
    typealias ContentCompletion = ((Result<Any?, Any?>) -> Void)
    
    let managerSpecials: [ManagerSpecial] = []
    
    private var total = 0
    
    var totalCount: Int {
      return total
    }
    
    var currentCount: Int {
      return managerSpecials.count
    }
    
    
    func managerSpecialsContent(at index: Int) -> ManagerSpecial {
        return managerSpecials[index]
      }

      init(delegate: ManagerSpecialsViewModelProtocol) {
          self.delegate = delegate
      }
    
    func fetchManagerSpecialContnents(completion: @escaping ContentCompletion) {
        
        let urlStr = "https://raw.githubusercontent.com/Swiftly-Systems/code-exercise-ios/master/backup"
        
        let url = URL(string: urlStr)
        
        let componentsURL = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        var request = URLRequest(url: (componentsURL?.url)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { jsonData, response, error in
            
            if let _ = error {
              let APIError = NSError(domain: "SwiftlyAdds", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey:"Unknown API response-2"])
              OperationQueue.main.addOperation({
                completion(.failure(response, APIError))
              })
              return
            }
            
            guard let _ = response as? HTTPURLResponse, let jsonData = jsonData else {
                let APIError = NSError(domain: "SwiftlyAdds", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey:"Unknown API response-3"])
                OperationQueue.main.addOperation({
                    completion(.success(nil, APIError))
                })
                return
            }
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(#line, #function, "DBG(ppp-)-only-json:", jsonString)
            }
            
            let managerModel = try? JSONDecoder().decode(ManagerSpecialsModel.self, from: jsonData)
             if let managerModel = managerModel {
               // print("managermodel:", managerModel )
                completion(.success(managerModel, response))
             }
           }
           task.resume()
    }
}
