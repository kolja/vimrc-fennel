
(values [
	(parse "defn" "(defn $1 [$2] $0)")
    (parse "dl" "Debug.Log($0);")
    (parse "if" "if ($1)\n{\n\t$0\n}")
] [
	(parse "autotrig" "autotriggered, if enabled")
])

