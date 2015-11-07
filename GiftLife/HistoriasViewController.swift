//
//  HistoriasViewController.swift
//  GiftLife
//
//  Created by MacBook Pro on 06/11/15.
//  Copyright © 2015 UTEZ. All rights reserved.
//

import UIKit

class HistoriasViewController: UIViewController {
    
let ipDomain = "http://sharelife-xenondevelops.c9users.io/experiencia"
//let ipDomain = "http://pruebas.gobiernodigital.morelos.gob.mx/WebServicesOP-TEG/webServices/obras.json?id=4"
    var urls:[String] = []
    var publicacionesTexto:[String] = []
    var publicacionesNombre:[String] = []
    var publicaciones:[Informacion] = []
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inicializar()
        
        urls=["https://design.atlassian.com/images/personas/alana.jpg","http://static.batanga.com/sites/default/files/styles/full/public/curiosidades.batanga.com/files/Las-personas-de-ojos-azules-son-descendientes-de-un-mismo-individuo-1_0.jpg?itok=VrDivXQ8","http://static.batanga.com/sites/default/files/styles/full/public/curiosidades.batanga.com/files/Las-personas-con-ojos-azules-derivan-de-un-unico-ancestro-01.jpg?itok=05_Ap4hZ","http://static.blogo.it/seriestvblog/MasiOka.jpg","http://www.fundspeople.com/system/media/7657/zoom/parames_foto_perfil_m%C3%A1s_leido.jpg?1419953389"]
        
        publicacionesTexto=["Yo quería hacerlo, pero si algo me pasaba, dejaba una familia","La ola te arrastra y sólo nadas... No hay mucho que preguntarse","Mi vida no ha cambiado. De no ser por la cicatriz, no notaría ningún cambio","Mucha gente me dice 'súper papá', pero yo fui sólo una parte","Bajo riesgo y buenos resultados","Los últimos tres meses antes de la operación fueron muy duros","Le dije al médico: 'De aquí a dos meses voy a tener un riñón comprado"]
        
        
        publicacionesNombre=["Elia Martínez","Edna Solís","Juan Aro", "Hitome Hatsune","Bill Jobs"]
        
        if urls.isEmpty {
            let alerta = UIAlertController(title: "Notificación", message: "No se encontraron resultados", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                
            }))
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    
    private func inicializar(){
        let requestString = ipDomain
        Utilities.post(requestString, postCompleted: { (succeeded, msg, json) -> () in
           
            self.actualizar(json as! NSDictionary)
           print(json)
            
        })
        
    }
    
    private func actualizar(json: NSDictionary){
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //self.publicaciones = Informacion.returnInformacion(json)
            self.collectionView.reloadData()
            print("-------------------------")
        })
            
        
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! PublicacionViewCell
        
        cell.imageView.image = nil
       
        //cell.nombre.text = publicaciones[indexPath.row].nombre
        //cell.titulo.text = publicaciones[indexPath.row].titulo
        cell.contenido.text = publicacionesTexto[indexPath.row]
        cell.nombre.text = publicacionesNombre[indexPath.row]
        
        
        let filterQueue:dispatch_queue_t = dispatch_queue_create("filter queue", nil)
        dispatch_async(filterQueue, { () -> Void in
            let url:String = self.urls[indexPath.row] as String
            let data = NSData(contentsOfURL: NSURL(string: url)!)!
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                cell.imageView.image = UIImage(data: data)
            })
        })
        
        
        return cell
    }
    


    
    
}
