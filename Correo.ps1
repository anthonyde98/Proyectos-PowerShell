------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- Este programa fue creado por Anthony Delanoy Peralta Perez, por lo que todos los scripts que tenga la funcion del bucle for, el foreach y el if que realiza una pausa de 1 hora, o simplemente se parezcan a este son de mi autoria. Estudiante que entregue un script parecido a este, fue conseguido ilegalmente. 

Programa: revisa si Word esta abierto y envia un mensaje, este corre hasta que se cierre, se pausa por 1 hora depues de enviar el mensaje.
Estudiante: Anthony Delanoy Peralta Pérez
Matricula: 100430840
Profesor: Radhames Silverio -
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

for([int]$i = 0; $i -eq 0){  - Bucle para que el programa funcione hasta que sea cerrado.

    $procesos = Get-process | Select-Object id, name, ws
    $verificar = 0

    foreach($proceso in $procesos){ - Revisa proceso por proceso.

        if($proceso.name -eq "WINWORD") - Revisa si el proceso revisado en el momento es el de winword, si lo es envia un correo.
        {
            	        $EmailPropio = "anthonyde98@gmail.com";
	        $EmailDestino = "anthonyde98@gmail.com";
	        $Asunto = "*AVISO*"
	        $Mensaje = "Microsoft Word está abierto."
	        $ServidorSMTP = "smtp.gmail.com"
	        $ClienteSMTP = New-Object Net.Mail.SmtpClient($ServidorSMTP, 587)
	        $ClienteSMTP.EnableSsl = $true
	        $ClienteSMTP.Credentials = New-Object System.Net.NetworkCredential("anthonyde98@gmail.com", "andepe98");
	        $ClienteSMTP.Send($EmailPropio, $EmailDestino, $Asunto, $Mensaje)

            $verificar = 1  - Esto verifica si el correo, o por lo menos, esta parte de codigo fue ejecutado. 
	
        }        
         
    }

    if($verificar -eq 1){ - Si el correo fue enviado o fue ejecutado la parte del codigo que envia el correo, el programa se pausa 1 hora.
        sleep -s 3600
    }
}
