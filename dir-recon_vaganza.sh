#!/bin/bash

echo "----------------------------"
echo "----------------------------"
echo "***  dir.Recon_Vaganza   ***"
echo "----------------------------"
echo "----------------------------"

echo ""
echo "Informe o site:"
read site

echo ""
echo ".... ---> Scanninnnng   :)"
echo ""

Total=$(wc -w /usr/share/wordlists/dirb/big.txt | cut -d " " -f 1)
echo "Esta lista contem $Total palavras."
echo ""


echo "++++++++++++++++++++++++++++++"
echo "   DIRETORIOS ENCONTRADOS     "
echo "++++++++++++++++++++++++++++++"

for palavraz in $(cat /usr/share/wordlists/dirb/big.txt);do
resp_1=$(curl -s -H "user-agent: Obaoba" -o /dev/null -w "%{http_code}" $site/$palavraz/)

if [ $resp_1 == "200" ];then
        echo "+ $site/$palavraz/"

        for arquivo in $(cat $Load_list);do
        resp_arq=$(curl -s -H "user-agent: Obaoba" -o /dev/null -w "%{http_code}" $site/$palavraz/$arquivo)
        if [ $resp_arq == "200" ];then
                echo " + --> $site/$palavraz/$arquivo"
        fi
        done
fi
done
echo ""
echo "                                     !!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "                                    Au revoir -----------------"
echo "                                 ----------------------------"
echo "                               ***  dir.Recon_Vaganza  ***  "
