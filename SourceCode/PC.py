import serial
from time import sleep, process_time
from timeit import default_timer as timer


def crc8(data):
	crc = 0
	for i in range(len(data)):
		byte = data[i]
		for b in range(8):
		    fb_bit = (crc ^ byte) & 0x01
		    if fb_bit == 0x01:
		        crc = crc ^ 0x18
		    crc = (crc >> 1) & 0x7f
		    if fb_bit == 0x01:
		        crc = crc | 0x80
		    byte = byte >> 1
	return crc

port = "/dev/ttyUSB0"
ser = serial.Serial(port, 2400, timeout=0)

print("Transmitting the message", end="")

message = "Finance Minister Arun Jaitley Tuesday hit out at former RBI governor Raghuram Rajan for predicting that the next banking crisis would be triggered by MSME lending, saying postmortem is easier than taking action when it was required. Rajan, who had as the chief economist at IMF warned of impending financial crisis of 2008, in a note to a parliamentary committee warned against ambitious credit targets and loan waivers, saying that they could be the sources of next banking crisis. Government should focus on sources of the next crisis, not just the last one. In particular, government should refrain from setting ambitious credit targets or waiving loans. Credit targets are sometimes achieved by abandoning appropriate due diligence, creating the environment for future NPAs,\" Rajan said in the note.\"Both MUDRA loans as well as the Kisan Credit Card, while popular, have to be examined more closely for potential credit risk. Rajan, who was RBI governor for three years till September 2016, is currently"

for i in range(20):
	ser.write(message[i*60:i*60+60].encode())
	print(".", end="")
	sleep(0.5)

ser.write("\n".encode())
ser.write("exit\n".encode())
sleep(1)
print("\nReceiving the message")
for i in range(20):
	data = ser.read(9999)
	if len(data) > 0:
		print(data.decode(), end="")
	sleep(0.5)

ser.close()
