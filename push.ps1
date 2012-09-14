$solutionDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)
$artifactsDir = (join-path $solutionDir "artifacts")
$packagesDir = (join-path $solutionDir "packages")
$nugetExePath = (join-path (join-path (join-path $packagesDir "NuGet.CommandLine.2.0.40001") tools) NuGet.exe)

$packages = dir "$artifactsDir\*.nupkg"

foreach($package in $packages) { 

    #$package is type of System.IO.FileInfo
    & $nugetExePath push $package.FullName $env:NUGET_API_KEY
}