:: Remove old zip(s)
if exist Celestial.zip del Celestial.zip
:: Make new zip(s)
tar -C celestial -acf Celestial.zip *
