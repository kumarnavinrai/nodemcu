LED_PIN1 = 1
LED_PIN2 = 3
LED_PIN4 = 4

US_TO_MS = 1000
num = 1

gpio.mode(LED_PIN1, gpio.OUTPUT)
gpio.mode(LED_PIN2, gpio.OUTPUT)
gpio.mode(LED_PIN4, gpio.OUTPUT)




while num < 11 do

   gpio.write(LED_PIN1, gpio.HIGH)
   tmr.delay(500 * US_TO_MS)
   gpio.write(LED_PIN1, gpio.LOW)
   tmr.delay(500 * US_TO_MS)

   gpio.write(LED_PIN2, gpio.HIGH)
   tmr.delay(500 * US_TO_MS)
   gpio.write(LED_PIN2, gpio.LOW)
   tmr.delay(500 * US_TO_MS)

   gpio.write(LED_PIN4, gpio.HIGH)
   tmr.delay(500 * US_TO_MS)
   gpio.write(LED_PIN4, gpio.LOW)
   tmr.delay(500 * US_TO_MS)


   
   if num > 8 then
    print('over 8')
   end
   num = num + 1
end
