createdb:
	docker exec -it learn_docker createdb --username=root --owner=root simple_banking
dropdb:
	docker exec -it learn_docker dropdb simple_banking
stopcontainer:
	docker stop learn_docker
startcontainer:
	docker start learn_docker
createcontainer : 
	docker run --name learn_docker -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres 
migratedbup : 
	migrate -path schema -database "postgresql://root:secret@localhost:5432/simple_banking?sslmode=disable" -verbose up
migratedbdown : 
	migrate -path schema -database "postgresql://root:secret@localhost:5432/simple_banking?sslmode=disable" -verbose down

.PHONY: createdb dropdb stopcontainer startcontainer createcontainer migratedbup migratedbdown