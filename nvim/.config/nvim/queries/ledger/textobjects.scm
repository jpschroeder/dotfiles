;; Transactions
(xact) @xact.outer

(plain_xact
  (payee) @xact.inner
)

;; Postings
(posting) @posting.outer

(posting
  (account) @posting.inner
)

;; Amounts
;; Track as parameters since they use 'a' shortcuts
(amount) @parameter.outer

(amount
  (quantity) @parameter.inner
)

(amount
  (negative_quantity) @parameter.inner
)
