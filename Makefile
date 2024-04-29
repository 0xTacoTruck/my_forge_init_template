-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil scopefile

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

all: remove install build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install foundry-rs/forge-std --no-commit && forge install openzeppelin/openzeppelin-contracts --no-commit

# Update Dependencies
update:; forge update

build:; forge build

test :; forge test 

snapshot :; forge snapshot

format :; forge fmt

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

slither :; slither . --config-file slither.config.json --checklist 

aderyn :; aderyn .

install-std:
	@forge install foundry-rs/forge-std --no-commit

install-solmate:
	@forge install transmissions11/solmate --no-commit

install-oz:
	@forge install OpenZeppelin/openzeppelin-contracts --no-commit

install-oz-upgradeable:
	@forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-commit

install-devtools:
	@forge install Cyfrin/foundry-devops --no-commit

install-cl:
	@forge install smartcontractkit/chainlink-brownie-contracts --no-commit

install-base:
	@forge install foundry-rs/forge-std --no-commit && @forge install Cyfrin/foundry-devops --no-commit --no-commit && @forge install OpenZeppelin/openzeppelin-contracts --no-commit && @forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-commit

dp-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_ALCHEMY_RPC_URL) --private-key $(SEPOLIA_METAMASK_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

help:
	@echo "Usage:"
	@echo "  make deploy [ARGS=...]\n    example: make deploy ARGS=\"--network sepolia\""
	@echo ""
	@echo "  make fund [ARGS=...]\n    example: make deploy ARGS=\"--network sepolia\""



NETWORK_ARGS := --rpc-url $(ANVIL_RPC_URL) --private-key $(ANVIL_0_PRIVATE_KEY) --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
endif


fund:
	@forge script script/Interactions.s.sol:FundFundMe $(NETWORK_ARGS)

withdraw:
	@forge script script/Interactions.s.sol:WithdrawFundMe $(NETWORK_ARGS)

