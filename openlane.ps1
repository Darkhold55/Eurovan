# Import the required module
Import-Module -Name PowerShellGet

# Create the headers hashtable
$headers = @{
    "Accept" = "application/json; application/vnd.backlotcars.v3;"
}

# Make the API call and store the response in a variable
$response = Invoke-RestMethod -Uri "https://openlane.com/api/condition_report/bb6f365526ce4a39" -Method Get -Headers $headers

# Convert the response to JSON format
$jsonResponse = $response | ConvertTo-Json -Depth 10

# Save the JSON response to a file
$jsonResponse | Out-File -FilePath "response.json"

# Print a success message
Write-Output "Response saved as response.json"