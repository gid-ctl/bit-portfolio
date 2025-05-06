;; Title: BitPortfolio - Decentralized Portfolio Management
;;
;; Summary: A Bitcoin-native portfolio management system for Stacks assets
;;
;; Description:
;; BitPortfolio is a decentralized portfolio management protocol built on the Stacks Layer 2
;; blockchain, enabling users to create, manage, and rebalance their crypto portfolios.
;; The contract provides automatic rebalancing capabilities, custom allocation settings,
;; and seamless integration with Bitcoin compliance standards through Stacks' unique
;; Bitcoin-anchored security model.
;;
;; The protocol enables:
;; - Portfolio creation with multiple token support
;; - Customizable allocation percentages
;; - Automatic rebalancing procedures
;; - Owner-controlled portfolio management
;; - Portfolio analysis tools

;; Constants and Error Codes

;; Error codes
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INVALID-PORTFOLIO (err u101))
(define-constant ERR-INSUFFICIENT-BALANCE (err u102))
(define-constant ERR-INVALID-TOKEN (err u103))
(define-constant ERR-REBALANCE-FAILED (err u104))
(define-constant ERR-PORTFOLIO-EXISTS (err u105))
(define-constant ERR-INVALID-PERCENTAGE (err u106))
(define-constant ERR-MAX-TOKENS-EXCEEDED (err u107))
(define-constant ERR-LENGTH-MISMATCH (err u108))
(define-constant ERR-USER-STORAGE-FAILED (err u109))
(define-constant ERR-INVALID-TOKEN-ID (err u110))

;; Data Variables

(define-data-var protocol-owner principal tx-sender)
(define-data-var portfolio-counter uint u0)
(define-data-var protocol-fee uint u25) ;; 0.25% represented as basis points

;; Constants

(define-constant MAX-TOKENS-PER-PORTFOLIO u10)
(define-constant BASIS-POINTS u10000)

;; Data Maps

(define-map Portfolios
    uint ;; portfolio-id
    {
        owner: principal,
        created-at: uint,
        last-rebalanced: uint,
        total-value: uint,
        active: bool,
        token-count: uint
    }
)