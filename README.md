# Project / Lesson Name

# QUICK SET UP NOTE

to use latest forge-std run 'git submodule update --remote'

# Lesson Notes (If applicable)

My notes taken during this course can be found in the ***Notes.md*** file of this repository.

# Lesson Exercises & Test Results (If applicable)

## Exercise 1 - Description

## Exercise 2 - Description

## Exercise 3 - Description

# General Foundry and Project Set-Up Information

## Set Up for new GitHub Repo

```
…or create a new repository on the command line
echo "# EXAMPLE" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/GITHUB_USERNAME/NAME_OF_REPO.git
git push -u origin main
```
```
…or push an existing repository from the command line
git remote add origin https://github.com/GITHUB_USERNAME/NAME_OF_REPO.git
git branch -M main
git push -u origin main
```

## Foundry Overview and Tips

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Environment Variables Usage

From the terminal, we probably want forge to use our `.env` file of variables, to do that - run the following command:
```shell
$ source .env
```

## Foundry Documentation

This project uses [Foundry](https://getfoundry.sh). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.

## Foundry Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Easy Testing with fork of mainnet

```shell
forge test -vvv --fork-url https://eth.drpc.org --fork-block-number 15969633
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

**Creating a local Anvil chain that you can interact with that is a fork of a chain:**

```shell
anvil --fork-url https://sepolia.drpc.org --fork-block-number 5781872
```

This will allow us to have tests run locally on a fork, allow you to use Foundry's `cast` command and all it's tools to interact with it. Really easy to do an super cool!

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Cast Function Signature

- Will return hexadecimal value
- Allows to check that we are doing what we expect to be doing- e.g check hex data in metamask against the hex value of function name to verify correct function is being called

```shell
$ cast sig "functionName()"
```

### Cast Using CallData Decode

- This is used to achieve the same goal of 'cast sig', however, this is used for functions that have parameters which makes the hex string much larger
- This would return what each of the parameters are for the function

```shell
$ cast --calldata-decode "functionName()" HexString(e.g.2a4d5b etc etc)
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

