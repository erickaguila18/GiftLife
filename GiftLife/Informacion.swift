//
//  Informacion.swift
//  GiftLife
//
//  Created by MacBook Pro on 06/11/15.
//  Copyright © 2015 UTEZ. All rights reserved.
//

import Foundation

class Informacion {
    
    var idPublicacion:Int!
    var contenido:String!
    var nombre:String!
    var imagen:String!
    var titulo:String!

    class func returnInformacion(json: NSDictionary) -> [Informacion]{
        
        let arreglo = json["Informacion"] as! NSArray
        var publicaciones:[Informacion] = []
        
        for var i = 0; i < arreglo.count; i++ {
            let publicacion:Informacion = Informacion()
            let reg = arreglo[i] as! NSDictionary
            
            publicacion.idPublicacion = reg["id"]! as! Int
            publicacion.contenido = reg["cont"]! as! String
            publicacion.nombre = reg["nom"]! as! String
            publicacion.imagen = reg["url"]! as! String
            publicacion.titulo = reg["url"]! as! String

            publicaciones.append(publicacion)
        }
        
        return publicaciones
    }
}