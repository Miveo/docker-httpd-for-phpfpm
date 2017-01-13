# Centos image with apache hhtpd (2.4) and php-fpm configuration

### How to use
Default configuration will search php-fpm on a `php` host on `9000` port.
You can override this values using environment variables
 - PHP_HOST
 - PHP_PORT

 
### docker-compose : 
     
```yaml
    version: "2.1"

    services:

        apache:
            image: miveo/centos-httpd-for-phpfpm
            volumes:
                # volume with project specific configuration (eg: vhost)
                - ./apache/my_project.conf:/etc/httpd/conf.d/my_project.conf
                # mount your project's source 
                - ../:/var/www/symfony
            ports:
                - 8080:80
            # if your php container have a different host/port than default value
            # environment:
            #     - PHP_HOST=php_fpm
            #     - PHP_PORT=9001
    
        php:
            image: miveo/centos-php-fpm:7.0
            tty: true
            volumes_from:
                - apache
            volumes:
                - ./php/99-test-project.ini:/etc/php.d/99-test-project.ini
            env_file:
                - docker-compose.env
