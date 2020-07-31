Import-module 'C:\Program Files\WindowsPowerShell\Modules\GDrive-Beta\GDrive.psm1'

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Connect-GDrive -UserName "anthonyde98@gmail.com" #Iniciando seción en gmail

$Label3 = New-Object System.Windows.Forms.Label
$TextBox1 = New-Object System.Windows.Forms.TextBox
$TextBox2 = New-Object System.Windows.Forms.TextBox
$Button2 = New-Object System.Windows.Forms.Button
$Button3 = New-Object System.Windows.Forms.Button

Function InitWindows(){
    $windows = New-Object System.Windows.Forms.Form
    $windows.Size = New-Object System.Drawing.Size(500,400)
    $windows.MinimumSize = New-Object System.Drawing.Size(500,400)
    $windows.MaximumSize = New-Object System.Drawing.Size(500,400)
    $windows.MaximizeBox = $false
    $windows.Text = 'GDrive'
    $windows.StartPosition = 'CenterScreen'
    Metodos

    $windows.ShowDialog()
}

Function Metodos(){
    Label1
    Label2
    TextBox1
    TextBox2
    Button1
    Button2
    Button3
}

Function Label1(){
    $Label1 = New-Object System.Windows.Forms.Label
    $Label1.Size = New-Object System.Drawing.Size(110,15);
    $Label1.Location = New-Object System.Drawing.Point(50,20)
    $Label1.Text = 'Dirección de carpeta'
    $Label1.BackColor = 'Blue'
    $label1.ForeColor = 'White'
    $windows.Controls.Add($Label1)
}

Function Label2(){
    $Label2 = New-Object System.Windows.Forms.Label
    $Label2.Size = New-Object System.Drawing.Size(102,15);
    $Label2.Location = New-Object System.Drawing.Point(255,20)
    $Label2.Text = 'Nombre de carpeta'
    $Label2.BackColor = 'Blue'
    $label2.ForeColor = 'White'
    $windows.Controls.Add($Label2)
}

Function Label3($Text){
    $Label3.Size = New-Object System.Drawing.Size(500,15);
    $Label3.Location = New-Object System.Drawing.Point(0,80)
    $Label3.Text = $Text
    $Label3.BackColor = 'Blue'
    $label3.ForeColor = 'White'
    $Label3.TextAlign = 2
    $windows.Controls.Add($Label3)
}

Function TextBox1(){
    $TextBox1.Size = New-Object System.Drawing.Size(200,15)
    $TextBox1.Location = New-Object System.Drawing.Point(10,40)

    $windows.Controls.Add($TextBox1)
}

Function TextBox2(){
    $TextBox2.Size = New-Object System.Drawing.Size(150,15)
    $TextBox2.Location = New-Object System.Drawing.Point(230,40)

    $windows.Controls.Add($TextBox2)
}

Function Button1(){
    $Button1 = New-Object System.Windows.Forms.Button
    $Button1.Size = New-Object System.Drawing.Size(45,44)
    $Button1.Location = New-Object System.Drawing.Point(385,20)
    $Button1.FlatStyle = 0
    $Button1.FlatAppearance.BorderSize = 0
    $Button1.FlatAppearance.MouseOverBackColor = '#F68CFF'
    $Button1.FlatAppearance.MouseDownBackColor = '#F142FF'
    $Button1.Image = New-Object System.Drawing.Bitmap('C:\Users\TOSHIBA\Desktop\Informatica\Sistemas Operativos\SO Mio\imagenes\com.ico')
    $Button1.Add_Click({ Button1_Add_Click })

    $windows.Controls.Add($Button1)
}

Function Button2(){
    $Button2.Size = New-Object System.Drawing.Size(45,44)
    $Button2.Location = New-Object System.Drawing.Point(430,20)
    $Button2.FlatStyle = 0
    $Button2.FlatAppearance.BorderSize = 0
    $Button2.FlatAppearance.MouseOverBackColor = '#F68CFF'
    $Button2.FlatAppearance.MouseDownBackColor = '#F142FF'
    $Button2.Image = New-Object System.Drawing.Bitmap('C:\Users\TOSHIBA\Desktop\Informatica\Sistemas Operativos\SO Mio\imagenes\des.ico')
    $Button2.Add_Click({ Button2_Add_Click })

    $windows.Controls.Add($Button2)
}

Function Button3(){
    $Button3.Size = New-Object System.Drawing.Size(200,200)
    $Button3.Location = New-Object System.Drawing.Point(140,150)
    $Button3.Image = New-Object System.Drawing.Bitmap('C:\Users\TOSHIBA\Desktop\Informatica\Sistemas Operativos\SO Mio\imagenes\nube.ico')
    $Button3.FlatStyle = 0
    $Button3.FlatAppearance.BorderSize = 0
    $Button3.FlatAppearance.MouseOverBackColor = 'Menu'
    $Button3.FlatAppearance.MouseDownBackColor = 'Menu'
    $Button3.Add_Click({ Button3_Add_Click })

    $windows.Controls.Add($Button3)
}

Function Button1_Add_Click(){
    CD C:\Users\TOSHIBA\Desktop
    $Directory = $TextBox1.Text
    $NameFile = $TextBox2.Text.Trim()
    $FolderGDrive = "Sistemas Operativos"
    $FolderPath = "C:\Users\TOSHIBA\Desktop" + "\" + $NameFile + ".zip"
    $TextBox1.Text = ""
    $TextBox2.Text = ""
    try{
        if($Directory.Length -gt 0 -and $NameFile.Length -gt 0){
            Label3("Comprimiendo...")
            Compress-Archive -LiteralPath $Directory -DestinationPath $NameFile -CompressionLevel Optimal #Comprimiendo Archivo
            Sleep 2
            Label3("Subiendo a Google Drive")
            $Label3.BackColor = "#D3C40C"
            Invoke-UploadFilesToGDrive -UserName "anthonyde98@gmail.com" -GDriveFolder $FolderGDrive -FolderPath $FolderPath
            Label3("Archivo Subido con exito!")
            $Label3.BackColor = "Green"
        }
    }catch [InvalidOperationException]{
        Label3("Dirección o nombre invalido")
        $Label3.BackColor = "Red"
    }
}

Function Button2_Add_Click(){
    $Directory = $TextBox1.Text
    $NameFile = $TextBox2.Text
    $TextBox1.Text = ""
    $TextBox2.Text = ""
     try{
        if($Directory.Length -gt 0){
            Label3("Descomprimiendo...")
            Expand-Archive -LiteralPath $Directory -DestinationPath $NameFile -Force #Descomprimiendo
            Label3("Descomprimido")
            $Label3.BackColor = "Green"
            Write-Host 2
        }
    }catch [InvalidOperationException]{
        Label3("Dirección o nombre invalido")
        $Label3.BackColor = "Red"
    }
}

Function Button3_Add_Click(){
    $Button3.Image = New-Object System.Drawing.Bitmap('C:\Users\TOSHIBA\Desktop\Informatica\Sistemas Operativos\SO Mio\imagenes\nube.ico')
    $PathFolder = "C:\Users\TOSHIBA\Desktop"
    Mkdir -Path $PathFolder -Name "Download" -Force
    Label3("Descargando...")
    $Label3.BackColor = "Green"
    try{
        Invoke-DownloadFilesFromGDrive -UserName "anthonyde98@gmail.com" -GDriveFolder "Sistemas Operativos" -FolderPath ($PathFolder + "\Download")
        Label3("Descarga Terminada con exito!")
    }catch [Exception]{
        Label3("Error de Conexión")
        $Label3.BackColor = "Red"
    }
    $Button3.Image = New-Object System.Drawing.Bitmap('C:\Users\TOSHIBA\Desktop\Informatica\Sistemas Operativos\SO Mio\imagenes\nube.ico')
}

InitWindows
