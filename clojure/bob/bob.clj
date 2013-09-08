(ns bob
  (:require [clojure.string :refer [blank? upper-case]]))

(defn silence? [sentence]
    (blank? sentence))

(defn shouting? [sentence]
    (= sentence (upper-case sentence)))

(defn question? [sentence]
    (= (last sentence) \?))

(defn response-for [sentence]
  (cond
    (silence? sentence) "Fine. Be that way!"
    (shouting? sentence) "Woah, chill out!"
    (question? sentence) "Sure."
    :else "Whatever."))