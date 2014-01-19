This is a slapped together test framework.

To create a test:

1. put a racket expression in a file `tst.$name`.
2. run `make exp.$name`.
3. verify that `exp.$name` contains the expected output.

To run the tests, just type `make`. for every passed test, a file
`ok.$name` will be created. If any tests fail, `make` will spit out an
error, which will include (within the garbled mess of error messages)
the diff between the expected and actual output.
