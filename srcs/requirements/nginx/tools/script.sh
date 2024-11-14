#!bin/bash
mkdir -p $CRT_PATH
sed -i "s#PROJECT.CRT#$INCEP_CRT#g" /etc/nginx/sites-available/default
sed -i "s#PROJECT.KEY#$INCEP_KEY#g" /etc/nginx/sites-available/default
sed -i "s#NGX_ROOT_PATH#$NGX_ROOT_PATH#g" /etc/nginx/sites-available/default
sed -i "s#SERVER_NAME#$WP_URL#g" /etc/nginx/sites-available/default
sed -i "s#CGI_PASS#$FASTCGI_PASS#g" /etc/nginx/sites-available/default
openssl req -x509 -nodes -out $INCEP_CRT -keyout $INCEP_KEY -subj $SSL_INFO
nginx -g 'daemon off;'