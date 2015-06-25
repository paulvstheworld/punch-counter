var SerialPort = require('serialport').SerialPort;
var serialPort = new SerialPort('/dev/cu.usbmodem1411', { baudrate: 9600 });

serialPort.on('open', function(data) {
  console.log('open');
  serialPort.on('data', function(data){
    console.log('data received: ' + data);
  });

  serialPort.write("ls\n", function(err, results) {
    console.log('err ' + err);
    console.log('results ' + results);
  });
});
