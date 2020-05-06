# Test file for "Lab7"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

test "Follows Sequence"
setPINA 0xFF
expectPORTB 0x00
timeContinue 1
expectPORTB 0x01
timeContinue 1
expectPORTB 0x02
timecontinue 1
expectPORTB 0x04
timeContinue 1
expectPORTB 0x02
timeContinue 1
expectPORTB 0x01
timeContinue 1
expectPORTB 0x02
timeContinue 1
expectPORTB 0x04
checkResult

test "Correct Stop On PB2, game begins even while button held"
setPINA 0xFF
expectPORTB 0x04
setPINA 0xFE
timeContinue 1
expectPORTB 0x04
expect state Wait
setPINA 0xFF
timeContinue 1
expectPORTB 0x04
expect state Stop
setPINA 0xFE
timeContinue 1
expectPORTB 0x01
expect state Game
timeContinue 1
expectPORTB 0x02
expect state Game
setPINA 0xFF
timeContinue 1
expectPORTB 0x04
expect state Game
checkResult

test "Correct Stop On PB1, Long press to stop"
setPINA 0xFF
expectPORTB 0x04
timeContinue 1
expectPORTB 0x02
expect state Game
setPINA 0xFE
timeContinue 1
expectPORTB 0x02
expect state Wait
timeContinue 3
expectPORTB 0x02
expect state Wait
setPINA 0xFF
timeContinue 1
expectPORTB 0x02
expect state Stop
checkResult

test "LCD Correctly increments/displays victory"
setPINA 0xFE
timeContinue 1
expectPORTB 0x01
expectPORTC 53
setPINA 0xFF
timeContinue 1
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x02
expectPORTC 54
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x02
expectPORTC 55
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x02
expectPORTC 56
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x02
expectPORTC 0x21
checkResult

test "LCD Decrements"
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 2
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x04
expectPORTC 52
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 2
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x04
expectPORTC 51
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 2
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x04
expectPORTC 50
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 2
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x04
expectPORTC 49
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 2
setPINA 0xFE
timeContinue 1
setPINA 0xFF
timeContinue 1
expectPORTB 0x04
expectPORTC 48
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
