# VerilogUtils

Some utilities for Verilog

Many pattern are commonly used in Verilog.
This project collects some reusable parameterized modules when I was writing homerorks.

Modules marked with \* are not tested in my homeworks, or even not implemented yet.

# ShiftReg.v
It can synthesis some small shift registers.

## SIPO
Serial in parallel out.

## PISO
Parallel in serial out.

## Delay\*
Delay a signal for some certain cycles.

# Bit.v
It does not synthesis anything theoretically.
Mainly operates on 2D signal arrays.

## Cvt2DTo1D
Concatenate a signal array (A bits \* B) into one long signal (A\*B bits).

## Cvt1DTo2D
Split one long signal into a signal array.
This is the inverse of **Cvt2DTo1D**.

## Reshape\*
Combining **Cvt2DTo1D** and **Cvt1DTo2D**, we can make `reshape` function like matlab.

## US2S\*
Convert an unsigned signal array to its signed one, just like `$signed` in 1D case.

## S2US\*
Convert an signed signal array to its unsigned one, just like `$unsigned` in 1D case.

## Slice\*
Utilities similar to `a[start:end:jump]` in python or `a(start:jump:end)` matlab.
It is recommended that `jump|(end-start)`

# MAC.v
## MAC
Multiply and accumulator.
