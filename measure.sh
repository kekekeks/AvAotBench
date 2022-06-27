#!/bin/bash

function measure
{
    local SampleName=$1
    local rid=$2
    rm tmp.txt -f
    capture="$(time ($SampleName/bin/Release/net6.0/$rid/publish/$SampleName crash 2>&1) 2>&1)"
    local EXIT_CODEZ=$?
    local TIME_DATA="$capture"
    # echo $EXIT_CODEZ
    if [ $EXIT_CODEZ -ne 42 ]
    then
        TIME_DATA="-1"
    fi

    echo "$TIME_DATA"
}

echo "Building Regular app"
rm AvaloniaAotBench/{bin,obj} -rf
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=None > /dev/null
echo "Measuring Regular app"
measure "AvaloniaAotBench" "linux-x64"

echo "Building Trimmed app"
rm AvaloniaAotBench/{bin,obj} -rf
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=Trimmed > /dev/null
echo "Measuring Trimmed app"
measure "AvaloniaAotBench" "linux-x64"

echo "Building R2R app"
rm AvaloniaAotBench/{bin,obj} -rf
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=R2R > /dev/null
echo "Measuring R2R app"
measure "AvaloniaAotBench" "linux-x64"

echo "Building R2R Composite app"
rm AvaloniaAotBench/{bin,obj} -rf
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=R2R > /dev/null
echo "Measuring R2R Composite app"
measure "AvaloniaAotBench" "linux-x64"

echo "Building NativeAOT app"
rm AvaloniaAotBench/{bin,obj} -rf
dotnet publish AvaloniaAotBench/AvaloniaAotBench.csproj -c Release -r linux-x64 /p:Mode=NativeAOT > /dev/null
echo "Measuring NativeAOT app"
measure "AvaloniaAotBench" "linux-x64"
