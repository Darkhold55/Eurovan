# Import the required module
Import-Module -Name PowerShellGet

$url = Read-Host -Prompt "Enter the OpenLane URL:"

# Extract the last part of the URL
$id_num = $url.Split("/")[-1]

# Remove any query parameters
$id_num = $id_num.Split("?")[0]

# Create the headers hashtable
$headers = @{"Accept" = "application/json; application/vnd.backlotcars.v3;"}

# Make the API call and store the response in a variable
$response = Invoke-RestMethod -Uri "https://openlane.com/api/condition_report/$id_num" -Method Get -Headers $headers
# Convert the response to JSON format
$jsonResponse = $response | ConvertTo-Json -Depth 10

# Save the JSON response to a file
$jsonResponse | Out-File -FilePath "$id_num.json"

# Print a success message
Write-Output "Response saved as $id_num.json"