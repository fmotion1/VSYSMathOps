function Get-CorrectRounding {
    <#
        .SYNOPSIS
            Correct rounding. Stolen shamelessly from PoshFunctions
            (https://www.powershellgallery.com/packages/PoshFunctions/2.2.10)

        .DESCRIPTION
            Correctly rounds a number. Optionally can specify the number
            of digits to round to. Default behavior for [math]::Round is
            to round [System.MidpointRounding]::ToEven so 2.5 would round
            to 2 as opposed to expected behavior of rounding to 3.
    #>

    [OutputType([double])]
    Param (

        [parameter(Mandatory,Position=0,ValueFromPipeline)]
        [double[]]
        $Number,

        [parameter(Mandatory=$false, Position=1)]
        [int]
        $Digit = 0,

        [parameter(Mandatory=$false)]
        [switch]
        $Detailed,

        [parameter(Mandatory=$false)]
        [ValidateSet(   'AwayFromZero',
                        'ToEven',
                        'ToZero',
                        'ToNegativeInfinity',
                        'ToPositiveInfinity',
                        IgnoreCase = $true
                    )]
        [String]
        $Method = 'AwayFromZero'
    )

    begin {
        switch ($Method) {
            "AwayFromZero"        {$RoundingMethod = [System.MidpointRounding]::AwayFromZero; break}
            "ToEven"              {$RoundingMethod = [System.MidpointRounding]::ToEven; break}
            "ToZero"	          {$RoundingMethod = [System.MidpointRounding]::ToZero; break}
            "ToNegativeInfinity"  {$RoundingMethod = [System.MidpointRounding]::ToNegativeInfinity; break}
            "ToPositiveInfinity"  {$RoundingMethod = [System.MidpointRounding]::ToPositiveInfinity; break}
        }
    }

    process {
        foreach ($curNum in $Number) {
            $ReturnVal = [double][math]::Round($curNum, $Digit, $RoundingMethod)
            if ($Detailed) {
                [PSCustomObject][ordered]@{
                    Original = $curNum
                    Digits = $Digit
                    Rounded = $ReturnVal
                    RoundingMethod = $RoundingMethod
                }
            } else {
                $ReturnVal
            }
        }
    }
}

Get-CorrectRounding 2.95 -Digit 0
