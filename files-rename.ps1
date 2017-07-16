param(
[string]$s, # string to strip
[string]$r, # string to replace s with if provided
[string]$p # path to folder/directory, default current
)

echo "Start renaming files..."
if (!($s)) {
    echo "-s param missing. Defaulting to 'TVBOXNOW '"
    $s = "TVBOXNOW "
}
if (!($r)) {
    echo "-r param missing. Default to '' (empty string)"
    $r = ""
}
if (!($p)) {
    echo "-p param missing. Default to current working folder/directory"
    $p = (Get-Item -Path ".\" -Verbose).FullName
}

echo ""
echo "Stripping: $s"
echo "Replacing with: $r"
echo "Folder/Directory: $p"

echo ""
echo "Renaming the following files..."
gci -Path "$p" -Filter "*$($s)*" -Name

gci -Path "$p" -Filter "*$($s)*" | rni -NewName { $_.name -Replace "$s", "$r" } | gci -Name
echo ""
echo "All done!"
