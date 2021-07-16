param(
$oldVersion = "0.1.0.0",
$version = "1.0.0.0",
$moduleName = "HarmanKardon.AVR.Commands",
$StartWith = "$env:USERPROFILE\Documents\GitHub"
)

$Repository = "$StartWith\$moduleName"
$moduleFolder = "$Repository\$moduleName"
$moduleManifestPath = "$moduleFolder\$version\$moduleName.psd1"
$manifest = Import-PowerShellDataFile -Path $moduleManifestPath -ErrorAction Ignore

Describe "Testing module" {
    
    it "must have a module manifest with the same as the module" {
        $moduleManifestPath | should -Exist
    }

    it "must have the description manifest key populated" {
        $manifest.Description | should -Not -BeNullOrEmpty
    }

    it "must have the Autor manifest key populated" {
        $manifest.Author | should -Not -BeNullOrEmpty
    }

    it "must have a ModuleVersion manifest key populated" {
        $manifest.ModuleVersion | should -BeGreaterThan ([version]::new($oldVersion))
    }

    it "must pass Test-ModuleManifest validation" {
        Test-ModuleManifest -Path $moduleManifestPath | Should -Be $true
    }

    it "must have associated Pester tests" {
        "$Repository\tests\$moduleName.Tests.ps1" | Should -Exist
    }

    it "muss pass PSScriptAnalyzer rules" {
        Invoke-ScriptAnalyzer -Path "$moduleFolder\$version\$moduleName.psm1" -ExcludeRule PSUseDeclaredVarsMoreThanAssignments | should -BeNullOrEmpty
    }
}