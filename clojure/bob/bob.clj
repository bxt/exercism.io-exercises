(ns bob)
(defn response-for [sentence]
  (if (clojure.string/blank? sentence)
    "Fine. Be that way!"
    (if (= sentence (clojure.string/upper-case sentence))
      "Woah, chill out!"
      (if (= (last sentence) \?)
        "Sure."
        "Whatever."))))