#!/usr/bin/env racket
#lang racket

(require racket/string)

; c-ident : string? -> bool?
;; (c-ident x) returns true iff x is a valid c identifier.

(define (gen-arglist args)
  (format "(~a)"
          (string-join args ", ")))

(define (gen-fundef fdef)
  (match fdef
         [(list 'func name args return-type body ...)
          (string-join
              (list
                  (gen-type return-type)
                  (gen-ident name)
                  (gen-arglist (map gen-type/var? args))
                  (gen-block body)
              " "))]))

; gen-ident : symbol? -> c-ident?
(define (gen-ident id)
  (format "~a" id))

(define (gen-block body)
  (format "\n{\n~a\n}\n"
    (string-join (map gen-decl/stmt body) "\n")))

(define (gen-decl/stmt d/s)
  (match d/s
         [(list 'return ex) (format "return ~a;" (gen-expr ex))]))

(define (gen-expr ex)
  (format "~a" ex))

(define (gen-type type)
  (match type
                           ; XXX: be careful here! need to make sure this is
                           ; really okay in the general case. (probably isn't,
                           ; esp. wrt to function pointers.)
         ;[(list ptr type2) (format "*~a" (gen-type type2))]
         [other (gen-ident other)]))

(define (gen-type/var? type/var?)
  (match type/var?
         [(list type) (gen-type type)]
         [(list var type)
          (match type
                 [other (format "~a ~a" (gen-ident other) (gen-ident var))])]))
