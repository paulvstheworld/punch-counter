var SerialPort = require('serialport').SerialPort;
var serialPort = new SerialPort('/dev/cu.usbmodem411', { baudrate:57600 });

serialPort.on('open', function(data) {
  console.log('open');
    serialPort.on('data', function(data){
	var force = data.readUIntBE(0,1);
	if (force > 80) {
	    console.log(force);
	}
	//console.log('data received: ' + data);
  });
});
