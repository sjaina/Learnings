help: ##Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e's/://' -e 's/##//'
frontend:  ## Install Frontend Component
	@bash frontend.sh
cart: 	   ## Install cart Component
	@bash cart.sh
catalogue: ## Install Catalogue Component
	@bash catalogue.sh
mongodb:   ## Install MongoDB Component
	@bash mongodb.sh
mysql: 	   ## Install MYSQL Component
	@bash mysql.sh
payment:   ## Install Payment Component
	@bash payment.sh
rabbitmq:  ## Install RabbitMQ Component
	@bash rabbitmq.sh
redis: 	   ## Install Redis Component
	@bash redis.sh
shipping:  ## Install Shipping Component
	@bash shipping.sh
database: #Installing all the Databases
database: mysql mongodb redis rabbitmq