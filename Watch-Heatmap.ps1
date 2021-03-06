function Watch-Heatmap
{
    <#
    .Synopsis
        Watches the performance heatmap
    .Description
        Watches the performance heatmap.  
        
        Performance counters that are at dangerous levels are in dangerous colors.
    .Example
        Watch-Heatmap
    .Link
        Add-HeatmapCounter
    .Link
        Remove-HeatmapCounter
    .Link
        Get-HeatmapCounter
    #>
    param(
    # If set, continously watches the heatmap
    [switch]$Continuous,
    
    # If set, waits this period of time between each sample of the heatmap    
    [Timespan]$WaitAfterGet = "0:0:0"
    )
    
    process {
        do {
            #region Get the values
            Get-HeatmapCounter -GetValue  |
                ForEach-Object {
                    $_.CounterSamples | 
                        ForEach-Object {
                            $_.pstypenames.clear()
                            $_.pstypenames.add('Heatmap')
                            $_
                                
                        }
                    
                }
            #endregion Get the values
            
            #region Wait if needed
            if ($Continuous -and $WaitAfterGet.TotalMilliseconds) {
                Start-Sleep -Milliseconds $WaitAfterGet.TotalMilliseconds
            }
            #endregion Wait if needed
        } while ($continuous)
        
        
    }
} 
