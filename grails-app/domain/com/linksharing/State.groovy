package com.linksharing

class State {
    String name
    String code
    static belongsTo = [country:Country]
    static constraints = {
    }
}
