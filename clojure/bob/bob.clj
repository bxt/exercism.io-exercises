(ns bob)

(defn silence? [sentence]
    (clojure.string/blank? sentence))

(defn shouting? [sentence]
    (= sentence (clojure.string/upper-case sentence)))

(defn question? [sentence]
    (= (last sentence) \?))

(defn response-for [sentence]
  (cond
    (silence? sentence) "Fine. Be that way!"
    (shouting? sentence) "Woah, chill out!"
    (question? sentence) "Sure."
    :else "Whatever."))