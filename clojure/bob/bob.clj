(ns bob)
(defn response-for [sentence]
  (cond
    (clojure.string/blank? sentence) "Fine. Be that way!"
    (= sentence (clojure.string/upper-case sentence)) "Woah, chill out!"
    (= (last sentence) \?) "Sure."
    :else "Whatever."))