

import Foundation
import UIKit
import CoreData

class Utilities {

    class func post(url : String, postCompleted : (succeeded: Bool, msg: String, json: NSObject) -> ()) {

        let request = NSMutableURLRequest(URL: NSURL(string: url)!) // MutableURLRequest para poder mandar parametros
        let session = NSURLSession.sharedSession() // Para poder hacer el Post request posteriormente
        request.timeoutInterval = 20
        request.HTTPMethod = "POST"
        //request.setValue("donador@gmail", forHTTPHeaderField: "email")
        //request.setValue("123", forHTTPHeaderField: "password")

        // Para decirle a la aplicacion que vamos a utilizar JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        // Crear HTTPRequest a partir de nuestro request del principio
        let task = session.dataTaskWithRequest(request, completionHandler:  {data, response, error in

            if error != nil {
                if error!.domain == NSURLErrorDomain && error!.code == NSURLErrorTimedOut {
                      postCompleted(succeeded: false, msg: "Timeout error in post dataTaskWithRequest: \(error!.localizedDescription)", json: ["respuesta" : "0"])
                } else {
                    postCompleted(succeeded: false, msg: "Error in post dataTaskWithRequest: \(error!.localizedRecoverySuggestion)", json: ["respuesta" : "0"])
                }
            } else {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! NSDictionary
                    print(json)
                    
                } catch let error as NSError {
                    postCompleted(succeeded: false, msg: "Error in request post JSONObjectWithDATA:  \(error.localizedDescription)", json: ["respuesta" : "0"])
    
                } catch {
                    postCompleted(succeeded: false, msg: "Error:  \(error)", json: ["respuesta" : "0"])
                }
            }

        })

        // Acabar la tarea del request
        task.resume()

    }

    
}


