# VerilogUtils

Some utilities for Verilog

Many pattern are commonly used in Verilog.
This project collects some reusable parameterized modules when I was writing homerorks.

Modules marked with \* are not tested in my homeworks (often because I intented to use it and give up), or even not implemented yet (I will implement when I need it or I am free).

一些 Verilog 的工具，因為許多 Verilog 的形式很容易在不同的設計中不斷出現，因此將之模組化似乎是個不錯的選項。這邊蒐集了一些我在作業用用到的模組。

有些模組會標示 \*，那代表我還沒測試（通常是因為我本來想用但後來沒到），或是有需要／有空的時候我會實做他。

# ShiftReg.v
It can synthesis some small shift registers.

會合成一些 shift register。

## SIPO
Serial in parallel out.

不知道怎麼解釋。

## PISO
Parallel in serial out.

不知道怎麼解釋。

## Delay\*
Delay a signal for some certain cycles.

把信號延遲幾個 clock。

# Bit.v
It does not synthesis anything theoretically.
Mainly operates on 2D signal arrays (type conversion).

理論上不會合出任何邏輯閘，主要是對 2D 陣列的操作 (type conversion)。

## Cvt2DTo1D
Concatenate a signal array (A bits \* B) into one long signal (A\*B bits).

把一串 2D 信號 (A bits \* B) 接成一個長的 1D 信號 (A\*B bits)。

## Cvt1DTo2D
Split one long signal into a signal array.
This is the inverse of **Cvt2DTo1D**.

`Cvt2DTo1D` 那個的相反，不解釋。

## Reshape\*
Combining **Cvt2DTo1D** and **Cvt1DTo2D**, we can make `reshape` function like matlab.

把前兩個合起來可作到類似 matlab 的 `reshape` 功能。

## US2S\*
Convert an unsigned signal array to its signed one, just like `$signed` in 1D case.

對信號增加 sign 性質。

## S2US\*
Convert an signed signal array to its unsigned one, just like `$unsigned` in 1D case.

把信號的 sign 性質拿掉。

## Slice\*
Utilities similar to `a[start:end:jump]` in python or `a(start:jump:end)` matlab.
It is recommended that `jump|(end-start)`

希望作到像是 python `a[start:end:jump]` 或是 matlab 的 `a(start:jump:end)` 固定間隔取 bit，輸入滿足 `jump|(end-start)`，不然我不知道會怎樣。

# MAC.v
## MAC
Multiply and accumulator.

乘加器。
