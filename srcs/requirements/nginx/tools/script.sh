#!bin/bash
mkdir -p $CRT_PATH
sed -i "s#PROJECT.CRT#$INCEP_CRT#g" /etc/nginx/nginx.conf
sed -i "s#PROJECT.KEY#$INCEP_KEY#g" /etc/nginx/nginx.conf
sed -i "s#NGX_ROOT_PATH#$NGX_ROOT_PATH#g" /etc/nginx/nginx.conf
sed -i "s#SERVER_NAME#$URL_WP#g" /etc/nginx/nginx.conf
sed -i "s#CGI_PASS#$FASTCGI_PASS#g" /etc/nginx/nginx.conf
openssl req -x509 -nodes -out $INCEP_CRT -keyout $INCEP_KEY -subj $SSL_INFO
nginx -g "daemon off;"