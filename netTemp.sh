#!/bin/bash


weather=`curl -s 'api.openweathermap.org/data/2.5/weather?lat=39.75&lon=-105.06&appid=ff158af4588a0a05bfe402945d766196'`
echo -n $(echo `echo $weather | egrep -o temp\"\:[0-9]{3} | tail -c -4`-273 | bc)C,\  
echo -n `echo $weather | egrep -o \"description.\{1,16\}\"\, | sed 's/.*\://g;s/\"//g;s/,//g'`\,
echo -n " $(echo $weather | egrep -o wind\".\{1,16\}\, | sed 's/\"//g;s/{.*:/\ /g;s/\,/\ m\/s/g'),"
echo -n " $(echo $weather | egrep -o humidity.\{4,5\}\}\, | sed 's/idity../\: /g;s/..$/%/g')"
echo
