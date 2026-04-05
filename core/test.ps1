 Add-Type -AssemblyName PresentationFramework
 $xaml = [System.IO.File]::ReadAllText("C:\Users\Administrator\.gemini\antigravity\scratch\powershell-antivirus\core\AntigravityUI.ps1")
 $start = $xaml.IndexOf('<Window')
 $end = $xaml.IndexOf('</Window>') + 9
 $xamlText = $xaml.Substring($start, $end - $start)
 try {
     $reader = [System.Xml.XmlReader]::Create([System.IO.StringReader] $xamlText)
         $null = [System.Windows.Markup.XamlReader]::Load($reader)
             Write-Host "XAML Loaded OK"
             } catch {
                 Write-Error $_.Exception.ToString()
                 }

                 
