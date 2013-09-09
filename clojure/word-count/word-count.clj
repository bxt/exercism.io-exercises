(ns phrase
  (:require [clojure.string :as s]))

(defn word-count [string]
  (frequencies (re-seq #"\w+" (s/lower-case string))))