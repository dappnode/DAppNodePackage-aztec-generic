# Aztec Dappnode Package QuickStart Guide

This package allows you to run an **Aztec Sequencer Node**, a crucial infrastructure responsible for ordering transactions and producing blocks in the Aztec network.

For detailed instructions about Aztec Protocol, please refer to the [Aztec documentation](https://docs.aztec.network/).

### Pre-requisites

The Aztec Sequencer Node requires a synced Ethereum node, depending on the network. The execution layer & consensus layer API endpoints must be provided in the package configuration, like `http://geth.sepolia-geth.dappnode:8545` and `http://prysm-sepolia.dappnode:3500` 


### Package Details

A Validator Private Key & a Coinbase Address are required to run the package. The Private Key is needed as your validator will post blocks to Ethereum, and the Coinbase Address is where any rewards will be sent.

Right now, becoming a Validator on Aztec is throttled with time. This package will try to register your validator every 24 hours, until it is successful. For more information, please refer to the Aztec "Run a node" [documentation](https://docs.aztec.network/the_aztec_network/guides/run_nodes/how_to_run_sequencer).