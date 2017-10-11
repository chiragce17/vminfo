
function connect_vCenter
{
    process
    {
        $uname = Read-Host "Enter vCenter Username "
        $pass = Read-Host "Enter vCenter Password "

        if(Connect-VIServer 192.168.0.107 -Protocol https -User $uname -Password $pass)
        {
            Write-Host "Connected to vCenter Successfully" -BackgroundColor Blue

            Import-Csv -Path D:\Test\testcsv.csv | ForEach-Object{
                if(Get-VM $_.Servername -ErrorAction Ignore)
                {
                    $vm = $_.Servername
                    Write-Host "$VM Exists "
                    $hotplg = Get-View -ViewType VirtualMachine -Filter @{"Name"=$VM}
                    if((!($hotplg.config.CpuHotAddEnabled)) -or (!($hotplg.config.MemoryHotAddEnabled)))
                    {
                        Write-Host "CPU or Memory Hot Plug is not enabled " -BackgroundColor Red -ForegroundColor White
                        Write-Host "Checking VM is Powerdown or Not"
            
                        $powerstate = Get-VM $VM

                        if($powerstate.PowerState -eq "PoweredOff")
                        {
                            Write-Host "$VM is Powered Off ...Modifying Resources"

                           Get-VM $VM | Select Name,NumCpu,MemoryGB  
                           Set-VM $VM -NumCpu $_.CPU -MemoryGB $_.RAM -Confirm:$false
                           Write-Host "After Expansion "
                           Get-VM $VM | Select Name,NumCpu,MemoryGB
                        }

                        else
                        {
                            Write-Host "$vm is Powered On " -BackgroundColor Magenta 
                        }
                    } 
                }   

                else
                {
                    Write-Host $_.Servername "VM Does not exist"
                }
            }
        }

        else
        {
            Write-Host "Can't connect to vCenter" -BackgroundColor Red
        }

    }
}

Connect_vCenter
#Import-Csv -Path D:\Test\testcsv.csv | ForEach-Object{}