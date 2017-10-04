#ERASE ALL THIS AND PUT XAML BELOW between the @" "@
$inputXML = @"
<Window x:Class="WpfApp1.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApp1"
        mc:Ignorable="d"
        Title="VM Information" Height="623.298" Width="1054.965">
    <Grid Margin="0,0,2,4" AutomationProperties.IsRequiredForForm="True">
        <Grid.RowDefinitions>
            <RowDefinition Height="509*"/>
            <RowDefinition Height="79*"/>
        </Grid.RowDefinitions>
        <Label Content="Enter vCenter Server Name / IP" HorizontalAlignment="Left" Margin="27,24,0,0" VerticalAlignment="Top" Width="184" Background="#FFCDBBBB" Height="26"/>
        <TextBox x:Name="vcenternametxtbx" HorizontalAlignment="Left" Height="26" Margin="227,24,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="279" AutomationProperties.IsRequiredForForm="True"/>
        <Label Content="vCenter Username" HorizontalAlignment="Left" Margin="27,66,0,0" VerticalAlignment="Top" Width="184" Background="#FFCDBBBB" Height="26"/>
        <Label Content="vCenter Password" HorizontalAlignment="Left" Margin="27,110,0,0" VerticalAlignment="Top" Width="184" Background="#FFCDBBBB" Height="26"/>
        <TextBox x:Name="vcenterunametxtbx" HorizontalAlignment="Left" Height="26" Margin="227,66,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="279" AutomationProperties.IsRequiredForForm="True"/>
        <Button x:Name="vcenterconnectbtn" Content="Connect" HorizontalAlignment="Left" Margin="27,162,0,0" VerticalAlignment="Top" Width="226" Height="36" IsDefault="True" Background="#FFAEC9AE" FontFamily="Stencil" FontSize="22"/>
        <PasswordBox x:Name="vcenterpwdbx" HorizontalAlignment="Left" Margin="227,110,0,0" VerticalAlignment="Top" Width="279" Height="26"/>
        <Button x:Name="cancelbtn" Content="Cancel" HorizontalAlignment="Left" Margin="272,162,0,0" VerticalAlignment="Top" Width="234" Height="36" IsCancel="True" Background="#FF6A5A3E" FontFamily="Stencil" FontSize="22"/>
        <TextBlock x:Name="vcenterstatusbx" HorizontalAlignment="Left" Margin="590,24,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Height="58" Width="376" IsEnabled="False" FontFamily="Segoe UI Semibold" FontSize="18" Text="Connection Status will appear here" Foreground="#FF6A1414" Background="{DynamicResource {x:Static SystemColors.InactiveBorderBrushKey}}"/>
        <Button x:Name="testbtn" Content="Test" HorizontalAlignment="Left" Margin="563,172,0,0" VerticalAlignment="Top" Width="75" Height="20"/>
        <Label Content="Enter VM Name" HorizontalAlignment="Left" Margin="41,226,0,0" VerticalAlignment="Top" Width="106" RenderTransformOrigin="0.471,-0.83" Background="#FF8FA67D" Height="26"/>
        <TextBox x:Name="vmnametxtbx" HorizontalAlignment="Left" Height="27" Margin="165,225,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="213"/>
        <Button x:Name="vminfobtn" Content="Get Info" HorizontalAlignment="Left" Margin="398,219,0,0" VerticalAlignment="Top" Width="108" RenderTransformOrigin="0.411,-1.189" Height="33" Background="#FFB0B89D" BorderBrush="#FF643737"/>
        <Rectangle Fill="#FFF4F4F5" HorizontalAlignment="Left" Height="301" Margin="41,277,0,0" Stroke="Black" VerticalAlignment="Top" Width="781" Grid.RowSpan="2"/>
        <Label Content="VM Name" HorizontalAlignment="Left" Margin="68,312,0,0" VerticalAlignment="Top" Height="28" Width="98" Background="#FFAEAEAE"/>
        <Label Content="VM HOST" HorizontalAlignment="Left" Margin="68,411,0,0" VerticalAlignment="Top" Height="28" Width="98" Background="#FFAEAEAE"/>
        <Label Content="State" HorizontalAlignment="Left" Margin="68,361,0,0" VerticalAlignment="Top" Height="28" Width="98" Background="#FFAEAEAE"/>
        <TextBox x:Name="statebx" HorizontalAlignment="Left" Height="27" Margin="181,362,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209" IsEnabled="False"/>
        <TextBox x:Name="vmnamebx" HorizontalAlignment="Left" Height="27" Margin="181,314,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209" IsEnabled="False"/>
        <TextBox x:Name="hostbx" HorizontalAlignment="Left" Height="27" Margin="181,411,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209" IsEnabled="False"/>
        <Label Content="CPU" HorizontalAlignment="Left" Margin="428,312,0,0" VerticalAlignment="Top" Height="28" Width="98" Background="#FFAEAEAE"/>
        <Label Content="RAM (GB)" HorizontalAlignment="Left" Margin="428,361,0,0" VerticalAlignment="Top" Height="28" Width="98" Background="#FFAEAEAE"/>
        <Label Content="Used Space (GB)" HorizontalAlignment="Left" Margin="428,411,0,0" VerticalAlignment="Top" Height="28" Width="98" Background="#FFAEAEAE"/>
        <TextBox x:Name="spacebx" HorizontalAlignment="Left" Height="27" Margin="550,412,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209" IsEnabled="False"/>
        <TextBox x:Name="rambx" HorizontalAlignment="Left" Height="27" Margin="550,362,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209" IsEnabled="False"/>
        <TextBox x:Name="cpubx" HorizontalAlignment="Left" Height="27" Margin="550,313,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="209" IsEnabled="False"/>
        <Label Content="Notes" HorizontalAlignment="Left" Margin="68,481,0,0" VerticalAlignment="Top" Height="28" Width="98" Background="#FFAEAEAE"/>
        <TextBox x:Name="vmnotesbx" HorizontalAlignment="Left" Height="62" Margin="181,462,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="255" IsEnabled="False" Grid.RowSpan="2"/>

    </Grid>
</Window>


"@       
 
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
 
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML
 
    $reader=(New-Object System.Xml.XmlNodeReader $xaml)
  try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch{Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
 
#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================
 
$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
 
Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable WPF*
}
 
Get-FormVariables
 
#===========================================================================
# Actually make the objects work
#===========================================================================

$Global:Connectionstate = 0
function getvminfo
{
    process
    {
        if(!(Get-VM $WPFvmnametxtbx.Text))
        {
            $WPFvcenterstatusbx.Text = $WPFvmnametxtbx.Text + " VM NOT FOUND.. Try again"
        }

        else
        {
            $vminfo = Get-VM $WPFvmnametxtbx.Text
            $WPFvmnamebx.Text = $WPFvmnametxtbx.Text
            $WPFcpubx.Text = $vminfo.NumCpu
            $WPFrambx.Text = $vminfo.MemoryGB
            $WPFstatebx.Text = $vminfo.PowerState
            $a = $vminfo | Select @{Name='UsedSpaceGB';Expression={[math]::Round($_.UsedSpaceGB,2)}}
            $WPFspacebx.Text = $a.UsedSpaceGB
            $WPFhostbx.Text = $vminfo.VMHost
            $WPFvmnotesbx.Text = $vminfo.Notes

        }
    }
}

function checkvcenterconnection
{
    process
    {
       if(Test-Connection -ComputerName $WPFvcenternametxtbx.Text -Count 4)
       {

            
           $WPFvcenterstatusbx.Text = $WPFvcenternametxtbx.Text + " Server is reachable"

           $WPFvcenterstatusbx.Text += " ....Connecting to vCenter"

           if(!(Connect-VIServer $WPFvcenternametxtbx.Text -username $WPFvcenterunametxtbx.Text -Password $WPFvcenterpwdbx.Password -Protocol https))
           {
               $WPFvcenterstatusbx.Text = "vCenter Connection Failed.. Please check Username or Password"
           }

           else
           {
                $Global:Connectionstate = 1    
                $WPFvcenterstatusbx.Text = "vCenter connection is successful"
           }
       }

       else
       {
            # $WPFvcenternametxtbx.Foreground.Color = "RED"
            $WPFvcenterstatusbx.Text = $WPFvcenternametxtbx.Text + " is not reachable" 
       }
    }
}

$WPFvminfobtn.Add_click({

        if($Global:Connectionstate -eq 0)
        {$WPFvcenterstatusbx.Text = "vCenter is not Connected.....First Connect vCenter"}

        else
        {getvminfo}
})
$WPFvcenterconnectbtn.Add_Click({
    if((Get-Module -ListAvailable Vmware.vimautomation.core) -and (Get-Module -ListAvailable vmware.vimautomation.cloud))
    {
        $WPFvcenterstatusbx.Text = "VM Modules are already Installed"
        checkvcenterconnection
    }

    else
    {
        $WPFvcenterstatusbx.Text = "VM Module is not available... Installing VM Module"

        Import-Module Vmware.vimautomation.core
        Import-Module vmware.vimautomation.cloud

        if(!((Get-Module -ListAvailable Vmware.vimautomation.core) -or (Get-Module -ListAvailable vmware.vimautomation.cloud)))
        {
            $WPFvcenterstatusbx.Text = "One of the Module installation failed.. Can't Connect to vCenter Troubleshoot"
            $WPFvcenterstatusbx.Text = "Closing vCenter Session in 5 seconds"
            Start-Sleep -Seconds 5 
        }

        else
        {
             $WPFvcenterstatusbx.Text = "VM Module Installation completed... Connecting vCenter now"
        }
    }
})


$WPFtestbtn.Add_Click({
      $WPFvcenterstatusbx.Text = $Global:Connectionstate
})
 
#Sample entry of how to add data to a field
 
#$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})
 
#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
$Form.ShowDialog() | out-null