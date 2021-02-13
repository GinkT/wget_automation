sync:
	wget -mkEpnp -P ~/site-content https://www.chiark.greenend.org.uk/~sgtatham/bugs-ru.html

run:
	sudo docker run -it --rm -d -p 8080:80 --name web \
	-v ~/site-content/www.chiark.greenend.org.uk:/usr/share/nginx/html nginx

cron:
	crontab crontabfile

deploy:
	-@make run
	ssh -N -L 8080:127.0.0.1:8080 $(USER)@$(ADDR)

sync-language:
	wget -kEp -P ~/check2 https://www.chiark.greenend.org.uk/~sgtatham/bugs-$(LANGUAGE).html
