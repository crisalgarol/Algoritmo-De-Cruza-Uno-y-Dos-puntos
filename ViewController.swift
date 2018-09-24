//
//  ViewController.swift
//  Practice3
//
//  Created by Cristian Salomon Olmedo on 21/03/18.
//  Copyright © 2018 Cristian Salomon Olmedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var poblacion = [[String]]()
    var poblacionCruzaOnePoint = [[String]]()
    var poblacionCruzaTwoPoints = [[String]]()

    //Función invocada tras cargar la app
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        
        //Crear la poblacion y hacer las cruzas
        for i in 0...4{
            poblacion.append(generarPareja())
            poblacionCruzaOnePoint.append(crossOnePoint(parents: poblacion[i]))
            poblacionCruzaTwoPoints.append(crossTwoPoints(parents: poblacion[i]))
        }
    }
    
    //Función que retorna el número de elementos en la tabla
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poblacion.count
    }
    
    //Función que inicializa los elementos de cada celda
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.parent1.text = poblacion[indexPath.row][0]
        cell.parent2.text = poblacion[indexPath.row][1]
        cell.childOneCross1.text = poblacionCruzaOnePoint[indexPath.row][0]
        cell.childOneCross2.text = poblacionCruzaOnePoint[indexPath.row][1]
        cell.twoPointCross1.text = poblacionCruzaTwoPoints[indexPath.row][0]
        cell.twoPointCross2.text = poblacionCruzaTwoPoints[indexPath.row][1]
        cell.familyNumber.text = "FAMILIA \(indexPath.row+1)" 
        
        return cell
    }

    //Botón que crea una nueva población, realiza las cruzas
    //y actualiza la tabla
    
    @IBAction func createButtonAction(_ sender: Any) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Creación de arreglos de strings
        poblacion = [[String]]()
        poblacionCruzaOnePoint = [[String]]()
        poblacionCruzaTwoPoints = [[String]]()
        
        for i in 0...4{
            //Se agrega el elemento devuelto por generarPareja, y ambas cruzas
            poblacion.append(generarPareja())
            poblacionCruzaOnePoint.append(crossOnePoint(parents: poblacion[i]))
            poblacionCruzaTwoPoints.append(crossTwoPoints(parents: poblacion[i]))
        }
        self.tableView.reloadData()
    }
    
    
    //Esta función genera una pareja de cadenas de tamaño 8
    func generarPareja() -> [String]{
        
        var padre = ""
        var madre = ""
        
        //La función arc4random crea números aleatorios
        //desde 0 hasta 1
        for _ in 1...8{
            padre += "\(Int(arc4random_uniform(2)))"
            madre += "\(Int(arc4random_uniform(2)))"
        }
        return [padre, madre]
    }
    
    //Realiza la cruza de un punto
    func crossOnePoint ( parents: [String]) -> [String]{
        
        /*
         La función prefix toma el "prefijo" de la cadena desde 0
         hasta la posicion 3 el sufijo hace lo mismo pero desde el
         final de la cadena hacia atrás 4 posiciones
         
         Aplicando el algoritmo correspondiente se hace para cada
         padre
         */
        let hijo1 = parents[0].prefix(4) + parents[1].prefix(4)
        let hijo2 = parents[1].suffix(4) + parents[0].suffix(4)
        return [String(hijo1), String(hijo2)]
        
    
    }
    
    /*
     La función aplica el algoritmo de cruza de dos puntos
     Se toman los prefijos de ambas cadenas desde 0 hasta la
     posicion 1 y luego se copian los alelos desde la posicion
     2 hasta la 5 y al final se agregan los sufijos de tamaño 2
     */
    func crossTwoPoints ( parents: [String]) -> [String]{
    
        let padreArray = Array(parents[0])
        let madreArray = Array(parents[1])

        var hijo1 = parents[0].prefix(2)
        var hijo2 = parents[1].prefix(2)
        
        
        for i in 2...5{
            hijo1 += "\(madreArray[i])"
            hijo2 += "\(padreArray[i])"
        }
        
        hijo1 += parents[0].suffix(2)
        hijo2 += parents[1].suffix(2)
        
        return [String(hijo1), String(hijo2)]
    }
    
    
}

