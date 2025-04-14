var mqtt = require('mqtt')
var client = mqtt.connect('mqtt://192.168.0.224', {
    username: "5wV9k0yPQ8NLoeNNYffA"
})

client.on('connect', function () {
    console.log('connected')
    client.subscribe('v1/devices/me/attributes/response/+')
    client.publish('v1/devices/me/attributes/request/1', '{"clientKeys":"attribute1,attribute2", "sharedKeys":"shared1,shared2"}')
})

client.on('message', function (topic, message) {
    console.log('response.topic: ' + topic)
    console.log('response.body: ' + message.toString())
    // client.end()
})