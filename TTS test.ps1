function Out-TextToSpeech {

   param (

           [Parameter(Mandatory=$true,

               ValueFromPipeline=$true)]

           [string]

           $Text,

           [switch]

           $Async=$false

         )

   [Reflection.Assembly]::LoadWithPartialName('System.Speech') | Out-Null

   $synth = New-Object System.Speech.Synthesis.SpeechSynthesizer

   if ($Async) {

       $synth.SpeakAsync($Text)

   } else {

       $synth.Speak($Text)

   }

}


 Get-ChildItem -File  '\\192.168.1.2\MEDIA' -filter "*.mkv" -Recurse  | Sort-Object LastWriteTime -Descending | Select-Object -First 10 |ForEach-Object {
        #If (Test-Path -Path $_.Name){
          $RootName = $_.Name -replace 'mkv',''
          Out-TextToSpeech -Text $RootName
          Write-Host $_.Name
          Write-Host "===================================="
          $nfopath = $_.FullName -replace 'mkv','nfo'
          

          $XPathThumb = "/movie/thumb"
          $XPathPlot = "/movie/plot"

        If (Test-Path -Path $nfopath){

         try {
         Write-Host $nfopath
          $ImgURL = Select-Xml -Path $nfopath -XPath $XPathThumb | Select-Object -ExpandProperty Node 
          Write-Host $ImgURL.'#text'
          $Plot = Select-Xml -Path $nfopath -XPath $XPathPlot | Select-Object -ExpandProperty Node 
          Write-Host $Plot.'#text'
          Out-TextToSpeech -Text $Plot.'#text'
          }Catch{
           Write-Host "error"
          }

         }

          Write-Host ""
          Write-Host ""

          #Copy-Item -Path $_.FullName -Destination 'F:\Movies\' -PassThru -force 
        #} 
    }

