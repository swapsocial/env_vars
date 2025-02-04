# tests.ps1
$env:APP_NAME
$env:APP_VERSION
$env:DATABASE_CONNECTION_STRING

# Pester test cases
Describe "Application Tests" {
    It "Application name should be correct" {
        $env:APP_NAME | Should -Be "MyApp"
    }

    It "Application version should be correct" {
        $env:APP_VERSION | Should -Be "1.0.0"
    }

    It "Database connection string should be set" {
        $env:DATABASE_CONNECTION_STRING | Should -Not -BeNullOrEmpty
    }

    It "API endpoint should be reachable" {
        $response = Invoke-WebRequest -Uri $env:API_ENDPOINT -UseBasicParsing
        $response.StatusCode | Should -Be 200
    }

    It "Max retries should be a positive number" {
        [int]$env:MAX_RETRIES | Should -BeGreaterThan 0
    }
}
