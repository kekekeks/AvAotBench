#!/bin/bash -e

function measure
{
    local SampleName=$1
    local rid=$2
    local TIME_DATA=$( ( time $SampleName/bin/Release/net6.0/$rid/publish/$SampleName crash 2>&1 | tee tmp.txt 2>&1 >/dev/null ; exit ${PIPESTATUS[0]} ) 2>&1 );
    if [ $? -ne 42 ]
    then
        TIME_DATA="-1"
    fi

    echo "$TIME_DATA"
}

echo "Building Trimmed app"
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=Trimmed > /dev/null
echo "Measuring Trimmed app"
measure "AvaloniaAotBench" "linux-x64"
echo "Trimmed " $TrimmedTime " ms"

echo "Building R2R app"
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=R2R > /dev/null
echo "Measuring R2R app"
measure "AvaloniaAotBench" "linux-x64"
echo "R2R " $R2RTime " ms"

echo "Building R2R Composite app"
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=R2R > /dev/null
echo "Measuring R2R Composite app"
measure "AvaloniaAotBench" "linux-x64"
echo "R2R Composite " $R2RCompositeTime " ms"

echo "Building NativeAOT app"
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=NativeAOT > /dev/null
echo "Measuring NativeAOT app"
measure "AvaloniaAotBench" "linux-x64"
echo "NativeAOT " $NativeAOTTime " ms"
