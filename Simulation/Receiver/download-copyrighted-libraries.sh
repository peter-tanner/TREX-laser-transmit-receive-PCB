mkdir -p temp && cd temp && curl https://www.ti.com/lit/zip/sbomc58 -OL && unzip sbomc58 && rm sbomc58 && cp lmh34400.lib .. && cd .. && rm -rf temp
mkdir -p temp && cd temp && curl https://www.ti.com/lit/zip/sbombz3 -OL && unzip sbombz3 && rm sbombz3 && cp TLV3601.lib .. && cd .. && rm -rf temp
mkdir -p temp && curl https://www.ti.com/lit/zip/slim251 -OL && unzip slim251 -d temp && rm slim251 && mv -f $(find temp -name '*.lib') . && rm -rf temp  
curl https://www.ti.com/lit/zip/scem637 -OL && unzip scem637; rm scem637