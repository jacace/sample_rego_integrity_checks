package example

default allow = false                               # unless otherwise defined, allow is false

#default javierRuleSet = false
#
#javierRuleSet {
#    input.items[_] == "medium"
#}


allow = true {                                      # allow is true if...
    count(violation) == 0                           # there are zero violations.
}

violation[item] {                                   # an item is in the violation set if...
    item := input.items[_]
    is_null(item.id)                                # 'id' should never be NULL
}

violation[item] {                                   # an item is in the violation set if...
    item := input.items[_]
    is_null(item.productName)                       # 'productName' should never be NULL
}

violation[item] {                                   # an item is in the violation set if...
    item := input.items[_]                          # priority should within these values
    item.priority != "high" ; item.priority != "low"
}

violation[items] {   
    items := input.items                              # an item is in the violation set if...
    count(items) != 5                                 # we expect 5 records
}

violation[item] {                                     # an item is in the violation set if...
    item := input.items[_]
    minNumViews := sum(0, 0)
    item.numViews <= minNumViews                      # numViews should be non negative
}

sum(a,b) = x { 
    x := a + b
}

# integrity checks (Pending)
#Complete reference: https://www.openpolicyagent.org/docs/latest/policy-reference/


#TODO: distribution checks
#at least half of the 'description's should contain a url
#.containsURL("description", _ >= 0.5)
# half of the items should have less than 10 'numViews'
#.hasApproxQuantile("numViews", 0.5, _ <= 10))