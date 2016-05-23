#!/bin/bash

#rsync -av --progress "/media/hpi/lehrveranstaltungen/Wirtschaftliche Grundlagen/Wirtschaftliche Grundlagen WS 2014-15/" ~/hpi/1_ws1415/wirtschaft/
#rsync -av --progress "/media/hpi/lehrveranstaltungen/Grundlagen_digitaler_Systeme/" ~/hpi/1_ws1415/gds/
#rsync -av --progress "/media/hpi/lehrveranstaltungen/Modellierung I/" ~/hpi/1_ws1415/mod1/

#rsync -av --progress "/media/hpi/lehrveranstaltungen/Mathematik_II_SS2015/" ~/hpi/2_ss15/mathe2/
#rsync -av --progress "/media/hpi/lehrveranstaltungen/Internet_und_WWW_Technologien/" ~/hpi/2_ss15/www/
#rsync -av --progress --exclude "RobotinoVM*.zip" --exclude "Visual_Paradigm*.exe" --exclude "Visual_Paradigm*.dmg" --exclude "RobotinoSimPro*.exe" --exclude "jdk*.exe" "/media/hpi/lehrveranstaltungen/FG Systemanalyse und Modellierung/Vorlesung - Modellierung II/" ~/hpi/2_ss15/mod2/
#rsync -av --progress "/media/hpi/lehrveranstaltungen/Recht für Ingenieure/Recht f Ingenieure I_Krohn_SS15/" ~/hpi/2_ss15/recht1/

#rsync -av --progress /media/hpi/lehrveranstaltungen/FG_SoftwareArchitekturen/SoftwareArchitecture_V/{Handouts,Reading} ~/hpi/3_ws1516/swa/

rsync -av --progress --exclude "ISE_machine.ova" /media/hpi/lehrveranstaltungen/VHDL/ ~/hpi/4_ss16/vhdl/

rsync -av --progress --exclude "Image/*" /media/hpi/lehrveranstaltungen/FG_SoftwareArchitekturen/SoftwareEngineering1_V/ ~/hpi/4_ss16/swt/
rsync -av --progress /media/hpi/lehrveranstaltungen/FG_Informationssysteme/VL\ DBS\ I/Folien\ 2016/ ~/hpi/4_ss16/db1/lecture/
