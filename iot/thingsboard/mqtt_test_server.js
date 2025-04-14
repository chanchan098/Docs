var mqtt = require('mqtt');
var client = mqtt.connect('mqtt://192.168.0.224', {
    username: "5wV9k0yPQ8NLoeNNYffA"
});

client.on('connect', function () {
    console.log('connected');
    client.subscribe('v1/devices/me/rpc/request/+', function (err, granted) {
        if (err) {
            console.error('Subscribe error:', err);
        } else {
            console.log('Subscribed to:', granted.map(g => g.topic).join(', '));
        }
    });

});

client.on('message', function (topic, message) {
    console.log('request.topic: ' + topic);
    console.log('request.body: ' + message.toString());
    var requestId = topic.slice('v1/devices/me/rpc/request/'.length);
    //client acts as an echo service
    client.publish('v1/devices/me/rpc/response/' + requestId, message);
});