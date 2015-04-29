#!/bin/bash

#rsync -av --progress "/media/hpi/lehrveranstaltungen/Wirtschaftliche Grundlagen/Wirtschaftliche Grundlagen WS 2014-15/" ~/hpi/1_ws1415/wirtschaft/
#rsync -av --progress "/media/hpi/lehrveranstaltungen/Grundlagen_digitaler_Systeme/" ~/hpi/1_ws1415/gds/
#rsync -av --progress "/media/hpi/lehrveranstaltungen/Modellierung I/" ~/hpi/1_ws1415/mod1/

rsync -av --progress "/media/hpi/lehrveranstaltungen/Mathematik_II_SS2015/" ~/hpi/2_ss15/mathe2/
rsync -av --progress "/media/hpi/lehrveranstaltungen/Internet_und_WWW_Technologien/" ~/hpi/2_ss15/www/
rsync -av --progress --exclude "RobotinoVM*.zip" "/media/hpi/lehrveranstaltungen/FG Systemanalyse und Modellierung/Vorlesung - Modellierung II/" ~/hpi/2_ss15/mod2/

