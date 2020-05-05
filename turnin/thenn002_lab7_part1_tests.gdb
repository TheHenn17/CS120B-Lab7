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

test "9-->0 holding"
setPINA 0xFF
timeContinue 1
expectPORTC 48
setPINA 0xFE
timeContinue 100
expectPORTC 57
setPINA 0xFD
timecontinue 1
expectPORTC 56
timeContinue 11
expectPORTC 55
timeContinue 11
expectPORTC 54
timeContinue 11
expectPORTC 53
timeContinue 11
expectPORTC 52
timeContinue 11
expectPORTC 51
timeContinue 11
expectPORTC 50
timeContinue 11
expectPORTC 49
timeContinue 11
expectPORTC 48
checkResult

test "0-->9 holding"
setPINA 0xFF
expectPORTC 48
setPINA 0xFE
timeContinue 1
expectPORTC 49
timeContinue 11
expectPORTC 50
timeContinue 11
expectPORTC 51
timeContinue 11
expectPORTC 52
timeContinue 11
expectPORTC 53
timeContinue 11
expectPORTC 54
timeContinue 11
expectPORTC 55
timeContinue 11
expectPORTC 56
timeContinue 11
expectPORTC 57
checkResult

test "9-->5 clicking, reset, 0-->5 clicking"
setPINA 0xFF
expectPORTC 57
setPINA 0xFD
timeContinue 1
expectPORTC 56
setPINA 0xFF
timeContinue 1
expectPORTC 56
setPINA 0xFD
timeContinue 1
expectPORTC 55
setPINA 0xFF
timeContinue 1
expectPORTC 55
setPINA 0xFD
timeContinue 1
expectPORTC 54
setPINA 0xFF
timeContinue 1
expectPORTC 54
setPINA 0xFD
timeContinue 1
expectPORTC 53
setPINA 0xFF
timeContinue 1
expectPORTC 53
setPINA 0xFC
timeContinue 1
expectPORTC 48
setPINA 0xFF
timeContinue 1
expectPORTC 48
setPINA 0xFE
timeContinue 1
expectPORTC 49
setPINA 0xFF
timeContinue 1
expectPORTC 49
setPINA 0xFE
timeContinue 1
expectPORTC 50
setPINA 0xFF
timeContinue 1
expectPORTC 50
setPINA 0xFE
timeContinue 1
expectPORTC 51
setPINA 0xFF
timeContinue 1
expectPORTC 51
setPINA 0xFE
timeContinue 1
expectPORTC 52
setPINA 0xFF
timeContinue 1
expectPORTC 52
setPINA 0xFE
timeContinue 1
expectPORTC 53
setPINA 0xFF
timeContinue 1
expectPORTC 53
checkResult

test "going over under"
setPINA 0xFC
timeContinue 1
expectPORTC 48
setPINA 0xFD
timeContinue 1
expectPORTC 48
timeContinue 11
expectPORTC 48
setPINA 0xFE
timeContinue 100
expectPORTC 57
timeContinue 11
expectPORTC 57
setPINA 0xFF
timeContinue 1
expectPORTC 57
setPINA 0xFE
timeContinue 1
expectPORTC 57
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
