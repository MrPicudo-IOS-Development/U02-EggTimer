import UIKit

class ViewController: UIViewController {
    
    // Creamos variables para el tiempo en (minutos) que tardan en estar listos los huevos cocidos.
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    // Creamos un diccionario para las variables de tiempo que tenemos arriba, con datos de distinto tipo.
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    /* Para conectar múltiples botones a un mismo IBAction, dejamos presionada la tecla control normal, y la movemos al bloque de código de la IBAction, o simplemente arrastramos desde el círculo de la IBAction al botón que queremos agregar, sin presionar ninguna tecla. */
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // Imprimimos el título del botón que fue presionado: print(sender.currentTitle!)
        let hardness = sender.currentTitle!
        // Imprimimos el valor del tiempo de cada botón dependiendo de cuál fue presionado con una estructura if-else
        if hardness == "Soft" {
            print(softTime)
        }
        else if hardness == "Medium" {
            print(mediumTime)
        }
        else {
            print(hardTime)
        }
    }
    
    // Ahora creamos la misma función para los botones, pero usando el diccionario y una estructura switch.
    @IBAction func hardnessButton(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        switch(hardness) {
            case "Soft":
                print(eggTimes["Soft"]!)
            case "Medium":
                print(eggTimes["Medium"]!)
            case "Hard":
                print(eggTimes["Hard"]!)
            default:
                print("Error")
        }
    }
    
    // La solución más eficiente, propuesta por Angela.
    @IBAction func angelaSolution(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        print(eggTimes[hardness]!) // Cuando obtenemos el valor de una llave, obtenemos un valor optional.
    }
    
}

/* Notas:
    Hay una advertencia que aparece cuando creamos una variable que no utilizamos para nada, y nos sugiere cambiarla por un guión bajo _ para que nosotros, y otras personas, entendamos el código más rápidamente. Esto es especialmente útil en estructuras repetitivas en donde no utilizamos el valor de la variable iterativa.
*/
