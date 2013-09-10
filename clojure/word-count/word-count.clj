(ns phrase
  (:require [clojure.string :as s]))

(def ^:private split (partial re-seq #"\w+"))

(defn word-count [string]
  (->  string s/lower-case split frequencies))