Avalonia Test App
=================

This application measure time to first frame when running application in different configurations

```
powershell -ExecutionPolicy Unrestricted -f measure.ps1
```

## Results
```
Building Trimmed app
Measuring Trimmed app
Trimmed     24.1403  ms

Building R2R app
Measuring R2R app
R2R          5.0092  ms

Building NativeAOT app
Measuring NativeAOT app
NativeAOT    5.0066  ms
```