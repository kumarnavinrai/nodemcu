--wifi.setmode(wifi.SOFTAP) -- set mode as access point
--wifi.ap.config({ssid= "ESP_TEST", pwd="123456789"}) 
--print(wifi.ap.getip())
function rconn() 
    wifi.setmode(wifi.STATION)
    --Set a static ip so its easy to access
    cfg = {
        ip="192.168.43.167",
        netmask="255.255.255.0"
      }
    wifi.sta.setip(cfg)
    wifi.sta.config("guli","narinder")
    print(wifi.sta.getip())
    wifi.sta.autoconnect(1)
end
wifi.setmode(wifi.STATION)
--Set a static ip so its easy to access
cfg = {
    ip="192.168.43.167",
    netmask="255.255.255.0"
  }
wifi.sta.setip(cfg)
wifi.sta.config("guli","narinder")
print(wifi.sta.getip())
wifi.sta.autoconnect(1)
led1 = 1
led2 = 2
led3 = 3
led4 = 4
led5 = 5
led6 = 6
led7 = 7
led8 = 8

gpio.mode(led1, gpio.OUTPUT)
gpio.mode(led2, gpio.OUTPUT)
gpio.mode(led3, gpio.OUTPUT)
gpio.mode(led4, gpio.OUTPUT)
gpio.mode(led5, gpio.OUTPUT)
gpio.mode(led6, gpio.OUTPUT)
gpio.mode(led7, gpio.OUTPUT)
gpio.mode(led8, gpio.OUTPUT)

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = buf.."<h1> Navin internet of things </h1>";
        buf = buf.."<p>GPIO0 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
        
        local _on,_off = "",""
        if(_GET.pin == "ON1")then
              gpio.write(led1, gpio.HIGH);
        elseif(_GET.pin == "OFF1")then
              gpio.write(led1, gpio.LOW);
        elseif(_GET.pin == "ON2")then
              gpio.write(led2, gpio.HIGH);
        elseif(_GET.pin == "OFF2")then
              gpio.write(led2, gpio.LOW);
        elseif(_GET.pin == "ON3")then
              gpio.write(led3, gpio.HIGH);
        elseif(_GET.pin == "OFF3")then
              gpio.write(led3, gpio.LOW);     
        elseif(_GET.pin == "ON4")then
              gpio.write(led4, gpio.HIGH);
        elseif(_GET.pin == "OFF4")then
              gpio.write(led4, gpio.LOW);         
        elseif(_GET.pin == "ON5")then
              gpio.write(led5, gpio.HIGH);
        elseif(_GET.pin == "OFF5")then
              gpio.write(led5, gpio.LOW);             
        elseif(_GET.pin == "ON6")then
              gpio.write(led6, gpio.HIGH);
        elseif(_GET.pin == "OFF6")then
              gpio.write(led6, gpio.LOW);                 
        elseif(_GET.pin == "ON7")then
              gpio.write(led7, gpio.HIGH);
        elseif(_GET.pin == "OFF7")then
              gpio.write(led7, gpio.LOW);                     
        elseif(_GET.pin == "ON8")then
              gpio.write(led8, gpio.HIGH);
        elseif(_GET.pin == "OFF8")then
              gpio.write(led8, gpio.LOW); 
        elseif(_GET.pin == "rconn")then
              rconn();                                                       
        end
        
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)
