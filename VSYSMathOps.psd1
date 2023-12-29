
@{
    RootModule = 'VSYSMathOps.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'ed47cbea-09a0-56ab-8c7e-78eaa229669e'
    Author = 'Futuremotion'
    CompanyName = 'Futuremotion'
    Copyright = '(c) Futuremotion. All rights reserved.'

    CompatiblePSEditions = @('Core')

    Description = 'Provides mathematical helper functions.'
    PowerShellVersion = '7.0'

    RequiredModules = @()
    RequiredAssemblies = @()
    CmdletsToExport = @()
    VariablesToExport = '*'
    AliasesToExport = @()
    ScriptsToProcess = @()
    TypesToProcess = @()
    FormatsToProcess = @()
    FileList = @()

    # Leave commented out to import into any host.
    # PowerShellHostName = ''

    FunctionsToExport = 'Get-CorrectRounding'

    PrivateData = @{
        PSData = @{
            Tags = @('Utility', 'Helper', 'Math', 'Mathematics')
            LicenseUri = 'https://github.com/fmotion1/VSYSMathOps/blob/main/LICENSE'
            ProjectUri = 'https://github.com/fmotion1/VSYSMathOps'
            IconUri = ''
            ReleaseNotes = '1.0.0: 11/30/2023 - Initial Release'
        }
    }
}