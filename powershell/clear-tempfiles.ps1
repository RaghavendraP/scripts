$tempfolders=@("C:\Users\*\AppData\Local\Temp\*") # You can add other temp directories like C:\Windows\Temp\* and C:\Windows\Prefetch\*
Remove-Item $tempfolders -Force -Recurse -WhatIf # To see which files the script will try to delete.
Remove-Item $tempfolders -Force -Recurse 
