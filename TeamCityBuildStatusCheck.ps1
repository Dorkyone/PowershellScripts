###############################################################
$username = "Login" 
$password = "Password"
#$TcProjectId - Project name with include our job in Teamcity
$TcProjectId="test"
$serverAddress = "http://teamcityServer:8111"
$command = $($serverAddress + "/httpAuth/app/rest/builds/?locator=project:$TcProjectId")
 
function Execute-HTTPPostCommand() {
    param(
        [string] $target = $null
    )
 
    $request = [System.Net.WebRequest]::Create($target)
    Write-Host $request.RequestUri
    $request.PreAuthenticate = $true
    $request.Method = "GET"
    $request.Credentials = new-object system.net.networkcredential($username, $password)
    $response = $request.GetResponse()
    $sr = [Io.StreamReader]($response.GetResponseStream())
    $xmlout = $sr.ReadToEnd()
    return $xmlout;
}
 
$xml = [xml]$(Execute-HTTPPostCommand $command)
$status = $xml.GetElementsByTagName("build")[0].status
###############################################################
