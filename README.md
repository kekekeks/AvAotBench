Avalonia Test App
=================

This application measure time to first frame when running application in different configurations

On Windows
```
powershell -ExecutionPolicy Unrestricted -f measure.ps1
```

or on Linux
```
./measure.sh
```

## Results
on Windows
```
Building Regular app
Measuring Regular app
Regular  6952.6733  ms

Building Trimmed app
Measuring Trimmed app
Trimmed  -1  ms

Building R2R app
Measuring R2R app
R2R  3749.0719  ms

Building R2R Composite app
Measuring R2R Composite app
R2R Composite  3635.6789  ms

Building NativeAOT app
Measuring NativeAOT app
NativeAOT  8696.1839  ms
```

on Linux
```
Building Regular app
Measuring Regular app

real    0m3.140s
user    0m3.151s
sys     0m0.117s
Building Trimmed app
Measuring Trimmed app
-1
Building R2R app
Measuring R2R app

real    0m1.956s
user    0m1.930s
sys     0m0.090s
Building R2R Composite app
Measuring R2R Composite app

real    0m1.947s
user    0m2.012s
sys     0m0.087s
Building NativeAOT app
Measuring NativeAOT app

real    0m1.407s
user    0m1.107s
sys     0m0.126s

```