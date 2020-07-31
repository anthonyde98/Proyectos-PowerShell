------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- Este programa fue creado por Anthony Delanoy Peralta Perez.

Programa: Recibe nombre y apellido de una persona y luego realiza un mensaje con la informacion recibida.
Estudiante: Anthony Delanoy Peralta Pérez
Matricula: 100430840
Profesor: Radhames Silverio -
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$nombre
$apellido
$mensaje

Write-host "Escribir tu nombre: "

$nombre = Read-Host

Write-host "Escribir tu apellido: "

$apellido = Read-Host

$mensaje = "Hola " + $nombre + " " + $apellido

write-host $mensaje