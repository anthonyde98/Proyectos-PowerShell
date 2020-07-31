----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- Este programa fue creado por Anthony Delanoy Peralta Perez junto con Carlos del Rosario, por lo que todos los scripts que se parezcan a este son de mi autoria y de Carlos. Estudiante que entregue un script parecido a este a diferencia de Carlos, fue conseguido ilegalmente.

Programa: Realiza calculos directamente al ingresar las operaciones.
Estudiante: Anthony Delanoy Peralta Pérez
Matricula: 100430840
Profesor: Radhames Silverio -
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Write-host "Escribe la operacion: " -NoNewline
$operacion = Read-Host
$Verificar = 0

try{
    for([int]$i = 0; $i -lt $operacion.Length; $i++)
    {
        if(($operacion[$i] -eq '+') -or ($operacion[$i] -eq '-') -or ($operacion[$i] -eq '*') -or ($operacion[$i] -eq '/'))
        {
             Switch($operacion[$i])
             {
              '+'{
                    [double]$numero1 = $operacion.Split("+")[0]
                    [double]$numero2 = $operacion.Split("+")[1]

                    [double]$Resultado = $numero1 + $numero2
                 }
              '-'{
                    [double]$numero1 = $operacion.Split("-")[0]
                    [double]$numero2 = $operacion.Split("-")[1]

                    [double]$Resultado = $numero1 - $numero2
                 }
              '*'{
                    [double]$numero1 = $operacion.Split("*")[0]
                    [double]$numero2 = $operacion.Split("*")[1]

                    [double]$Resultado = $numero1 * $numero2
                 }
              '/'{
                    [double]$numero1 = $operacion.Split("/")[0]
                    [double]$numero2 = $operacion.Split("/")[1]

                    [double]$Resultado = $numero1 / $numero2
                 }
              '^'{
                    [Int]$numero1 = $operacion.Split("^")[0]
                    [Int]$numero2 = $operacion.Split("^")[1]
                    [Double]$Resultado = 1
                    For ([Int] $j = 0; $j -lt $numero2; $j++)
                    {
                        $Resultado = $Resultado * $numero1
                    }
                  }
            	'!'{
                    [Int]$numero = $operacion.Split("!")[0]
                    [Double]$Resultado = $numero
                    For ([Int] $j = 0; $j -lt $numero-2; $j++)
                    {
                        $Resultado = $Resultado * ($numero - ($j + 1))
                    }
                  }
             }
        }        
    }
    else
    {
     Write-Host "La operacion no fue reconocida.
            Intenetelo nuevamente." -BackgroundColor DarkRed 
     $verificar = 1
    }    
        if($verificar -eq 0){ 
        Write-host "El resultado es", $Resultado -BackgroundColor DarkGreen
        }
    }
catch{
            Write-Host "Hubo un error leyendo uno de los numeros o la operacion no fue reconocida.
            Intenetelo nuevamente." -BackgroundColor DarkRed 
        }

