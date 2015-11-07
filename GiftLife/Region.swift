

import Foundation

class Region {
    
    var idRegion:Int!
    var region:String!
    var latitud:NSString!
    var longitud:NSString!
    var obras:Int!
    var acciones:Int!
    var montoObras:Double!
    var montoAcciones:Double!
    var montoTotal:Double!
    var imagen:UIImageView!
    
    class func returnRegiones(json: NSDictionary) -> [Region]{
        
        let arregloRegiones = json["Regiones"] as! NSArray
        var regiones:[Region] = []
        
        for var i = 0; i < 4; i++ {
            let region:Region = Region()
            let reg = arregloRegiones[i] as! NSDictionary
            
            region.idRegion = reg["id"]! as! Int
            region.region = reg["region"]! as! String
            region.latitud = reg["latitud"]! as! NSString
            region.longitud = reg["longitud"]! as! NSString
            
            region.obras = reg["numObras"]! as! Int
            region.montoObras = reg["montoObras"]! as! Double
            region.acciones = reg["numAcciones"]! as! Int
            region.montoAcciones = reg["montoAcciones"]! as! Double
            regiones.append(region)
        }
        
        return regiones
    }
}
