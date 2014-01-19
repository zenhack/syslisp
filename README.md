A racket library for generating c code.

The idea is, you can write:

    (gen-fundef
       '(func main ((argc int) (argv (ptr (ptr char)))) int
         (call printf "Hello, World!\n")
         (return 0)))

And this will spit out the equivalent C program. This is meant as a
stepping stone along the way to having a lisp-style macro system for use
with low-level code.

This is still *very* early days; It's a long way toward actually being
useful (the above code snippet doesn't even work yet!)
