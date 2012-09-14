$solutionDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)
$artifactsDir = (join-path $solutionDir "artifacts")
$packagesDir = (join-path $solutionDir "packages")
$nugetExePath = (join-path (join-path (join-path $packagesDir "NuGet.CommandLine.2.0.40001") tools) NuGet.exe)

#clean up and create new one
if(Test-Path $artifactsDir) { 
    del $artifactsDir -r
}

ni $artifactsDir -ItemType directory

$nuspecFiles = dir "$solutionDir\src\**\*.nuspec"

foreach($package in $nuspecFiles) { 

    #$package is type of System.IO.FileInfo
    & $nugetExePath pack $package.FullName -OutputDirectory $artifactsDir
}