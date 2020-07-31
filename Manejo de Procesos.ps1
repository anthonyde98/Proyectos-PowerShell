------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- Este programa fue creado por Anthony Delanoy Peralta Perez, por lo que todos los scripts que se parezcan a este son de mi autoria. Estudiante que entregue un script parecido a este, fue conseguido ilegalmente. 

Programa: Presenta los procesos con colores dependiendo su gasto de RAM, le da la oportunidad al ususario de detener los procesos por su nombre y por su ID. El programa se detiene cuando el usuario lo desee.
Estudiante: Anthony Delanoy Peralta Pérez
Matricula: 100430840
Profesor: Radhames Silverio -
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

do{

    $p = Get-process | Select-Object id, name, ws 
    $m = (Get-WMIObject Win32_PhysicalMemory | Measure-Object Capacity -Sum).sum

    foreach($mp in $p){

        if(($mp.ws / $m * 100) -le 19){

            Write-Host $mp.id,  " "  $mp.name,  " "  ($mp.WS / 1024000) " MB"  -ForegroundColor Green
        }
        elseif((($mp.ws / $m * 100) -gt 19) -and (($mp.ws / $m * 100) -le 44)){

            Write-Host $mp.id,  " "  $mp.name,  " "  ($mp.WS / 1024000) " MB"  -ForegroundColor yellow
        }
        elseif(($mp.ws / $m * 100) -gt 45){

            Write-Host $mp.id,  " "  $mp.name,  " "  ($mp.WS / 1024000) " MB"  -ForegroundColor red
        }

    }

    Write-Host "`nDetener Proceso `n`n1.Detener por id`n`n2.Detener por nombre`n`nIngrese numero: " -NoNewline
    $eleccion = Read-Host

    if($eleccion -eq 1){

        Write-Host "`nEscribir el id del proceso a detener : " -NoNewline
        $id = Read-Host

        $str = Get-Process -Id $id | Select-Object Name

        Write-Host "`n¿Quieres detener el proceso", $str.Name, "? | s o n |: " -NoNewline
        $opcion = Read-Host

        if($opcion -eq 's')
        {
            $str1 = "Stop-Process -Id " + $id
            Invoke-Expression $str1

            Write-Host "`nProceso detenido"
        }
        else
        {
            Write-Host "`nOperacion cancelada"
        }

    }
    elseif($eleccion -eq 2)
    {

        Write-Host "`nEscribir el nombre del proceso a detener : " -NoNewline
        $nombre = Read-Host

        $str = Get-Process -Name $nombre | Select-Object Name

        Write-Host "`n¿Quieres detener el proceso", $str.Name, "? | s o n |: " -NoNewline
        $opcion = Read-Host

        if($opcion -eq 's')
        {
            $str1 = "Stop-Process -Name " + $nombre
            Invoke-Expression $str1

            Write-Host "`nProceso detenido"
        }
        else
        {
            Write-Host "`nOperacion cancelada"
        }
    }

    Write-Host "`n¿Quieres detener otro proceso? | s o n |: " -NoNewline
    $opcion = Read-Host

}while($opcion -eq 's')
