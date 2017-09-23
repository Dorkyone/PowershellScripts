Param(
  [Parameter(
  Mandatory = $false,
  ParameterSetName = '')]
  [string]$Query
  )

$strDestination = 'C:\media\Sync\'
$strCopyNum = 5

$MySQLAdminUserName = ''
$MySQLAdminPassword = ''
$MySQLDatabase = 'myvideos107'
$MySQLHost = ''
$strConnectionString = "server=" + $MySQLHost + ";port=3306;uid=" + $MySQLAdminUserName + ";pwd=" + $MySQLAdminPassword + ";database="+ $MySQLDatabase

Try {
  Write-Host "Connecting to Kodi DB"
  Add-Type -Path("C:\Program Files (x86)\MySQL\Connector.NET 6.9\Assemblies\v4.0\MySql.Data.dll")
  $objConnection = New-Object MySql.Data.MySqlClient.MySqlConnection
  $objConnection.ConnectionString = $strConnectionString
  $objConnection.Open()

  $strSQL = "select concat(SUBSTRING(replace(strPath, '/', '\\'), 5) ,strFileName) as fPath, strFileName from myvideos107.files join myvideos107.episode on episode.idfile=files.idfile join myvideos107.path on path.idPath=files.idPath where files.playCount is null order by files.dateAdded ASC LIMIT " + $strCopyNum ;
  $objCommand = New-Object MySql.Data.MySqlClient.MySqlCommand($strSQL, $objConnection)
 
  $objDataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($objCommand)
  $objDataSet = New-Object System.Data.DataSet
  $RecordCount = $objDataAdapter.Fill($objDataSet, "KodiTVEpisodes")
  $strCount = 0
  Write-Host "Checking if last" $strCopyNum "recent TV episode entries in KODI need to be coppied to destination folder" $strDestination
  foreach ($Row in $objDataSet.Tables[0].Rows){
      $strFileName = $objDataSet.Tables[0].Rows[$strCount]["strFileName"]
      $strFullPath = $objDataSet.Tables[0].Rows[$strCount]["fPath"]
      $strEntry = $strCount + 1
      Write-Host "Checking if we need to copy entry" $strEntry "-->"$strFileName
      $strTransDest = $strDestination + $strFileName
      if (!(Test-Path -Path $strTransDest)) {
          Write-Host "Copying from " $strFullPath
          try {
            Copy-Item -Path $strFullPath -Destination $strDestination -force
            Write-Host "Copied " $strFileName
          }
          catch{
            Write-Host "Error occured during copy of" $strFullPath
          }
                    
          }else{
          Write-Host "File already exsists in destination folder"
          }
    $strCount = $strCount + 1
    }
  }

Catch {
  Write-Host "ERROR : Unable to run query : $strSQL `n$Error[0]"
 }

Finally {
  $objConnection.Close()
  Write-Host $strCount "TV episode enteries processed." 
  } 