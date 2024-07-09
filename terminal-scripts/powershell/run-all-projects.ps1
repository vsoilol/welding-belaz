Start-Process powershell -ArgumentList "cd ../../src/Belaz.WeldingApp.WeldingApi; dotnet run"
Start-Process powershell -ArgumentList "cd ../../src/Belaz.WeldingApp.RegistarApi; dotnet run"
Start-Process powershell -ArgumentList "cd ../../src/Belaz.WeldingApp.FileApi; dotnet run"
Start-Process powershell -ArgumentList "cd ../../src/Belaz.WeldingApp.IdentityApi; dotnet run"
Start-Process powershell -ArgumentList "cd ../../src/Belaz.WeldingApp.ApiGateway; dotnet run"
# Add more projects as needed