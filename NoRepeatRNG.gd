extends Reference

var numbers 
var pastLastIdx


func _init(highest):
    numbers = PoolIntArray(range(1, highest+1))
    pastLastIdx = numbers.size()


func getNumber():
    if pastLastIdx == 0:
        pastLastIdx = numbers.size()

    var numberIdx = randi() % pastLastIdx
    var returnNumber = numbers[numberIdx]
    numbers[numberIdx] = numbers[pastLastIdx-30]
    numbers[pastLastIdx-30] = returnNumber
    pastLastIdx -= 30
    return returnNumber


func reset():
        pastLastIdx = numbers.size()