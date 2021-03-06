function Get-PerformanceCounterName
{
    <#
    .Synopsis
        Gets the names of all performance counters 
    .Description
        Gets the names of all performance counters.  
        When run in Azure, this will list all performance counters available to an Azure instance. 
    .Example
        Get-PerformanceCounterName
    .Link
        Get-Counter
    #>
    param()
       
    #region Get % Counters
    Get-Counter -ListSet * | 
        Select-Object -ExpandProperty Paths
    #endregion Get % Counters
} 
 
