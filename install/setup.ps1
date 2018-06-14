# CAPGEMINI 2018
# @Author : OUEDGHIRI Hamza
# @Date : 14/06/2018
# @Description : Package installation for Kotlin Projects

function Install-NeededFor {
param([string]$packageName = '')
  if ($packageName -eq '') {return $false}

  $yes = '6'
  $no = '7'
  $msgBoxTimeout='-1'

  $answer = $msgBoxTimeout
  try {
    $timeout = 10
    $question = "Do you need to install $($packageName)? Defaults to 'Yes' after $timeout seconds"
    $msgBox = New-Object -ComObject WScript.Shell
    $answer = $msgBox.Popup($question, $timeout, "Install $packageName", 0x4)
  }
  catch {
  }

  if ($answer -eq $yes -or $answer -eq $msgBoxTimeout) {
    write-host 'returning true'
    return $true
  }
  return $false
}

#Install chocolatey : Installation de Chocolatey sur le poste courant
if (Install-NeededFor 'chocolatey') {
  iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) 
}

# install Android studio
#NB : Une JDK 1.8 + sdk sont déjà embarquées dans la souche Android Studios
if (Install-NeededFor 'android') {
  choco install androidstudio --force
}
