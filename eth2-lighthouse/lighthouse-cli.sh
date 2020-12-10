docker exec -it eth2-lighthouse_validator bash


#  QUICK REFERENCE COMMANDS
#    Validator Importing
#      lighthouse account validator import --network pyrmont --datadir /var/lib/lighthouse --directory /var/lib/lighthouse/validator_keys
#    Voluntary Exit
#      Copy the keystore-m JSON files into .eth2/validator_keys in this project directory.
#      lighthouse account validator exit --network pyrmont --beacon-node http://beacon:5052 --datadir /var/lib/lighthouse --keystore
#
#Run sudo docker-compose run --rm validator-voluntary-exit /var/lib/lighthouse/validator_keys/<name-of-keystore-file>, once for each keystore (validator) you wish to exit.