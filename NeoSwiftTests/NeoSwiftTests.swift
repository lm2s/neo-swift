//
//  NeoSwiftTests.swift
//  NeoSwiftTests
//
//  Created by Andrei Terentiev on 8/19/17.
//  Copyright © 2017 drei. All rights reserved.
//

import XCTest
import NeoSwift

class NeoSwiftTests: XCTestCase {
    func testGetBlockCount() {
        let exp = expectation(description: "Wait for block count response")
        
        NeoClient.sharedTest.getBlockCount() { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let count):
                print(count)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetBestBlockHash() {
        let exp = expectation(description: "Wait for block hash response")
        
        NeoClient.sharedTest.getBestBlockHash() { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let hash):
                print(hash)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
     func testGetBlockByHash() {
        let exp = expectation(description: "Wait for block hash response")
        
        NeoClient.sharedTest.getBlockBy(hash: "428cbb9661ec83c87a9944feff36d1146467028436e2f69bf57561d3206574c8") { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let block):
                print(block)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetBlockByIndex() {
        let exp = expectation(description: "Wait for block hash response")
        
        NeoClient.sharedTest.getBlockBy(index: 42) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let block):
                print(block)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetBlockHashByIndex() {
        let exp = expectation(description: "Wait for block hash response")
        NeoClient.sharedTest.getBlockHash(for: 42) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let hash):
                print(hash)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testConnectionCount() {
        let exp = expectation(description: "Wait for connection count response")
        
        NeoClient.sharedTest.getConnectionCount() { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let count):
                print(count)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetMemPool() {
        let exp = expectation(description: "Wait for mem pool response")
        
        NeoClient.sharedTest.getUnconfirmedTransactions() { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let transactions):
                print(transactions)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testTransactionForHash() {
        let exp = expectation(description: "Wait for transaction response")
        
        let hash = "469fe36c464442aa3eecc377f2093ad8594d0e764aad5e4aab5120ed4f3683fc"
        NeoClient.sharedTest.getTransaction(for: hash) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let transaction):
                print(transaction)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testTransactionOutput() {
        let exp = expectation(description: "Wait for block hash response")
        
        let hash = "2288ba9bd93da4ac4c414048f019300c8adadc6df5e4bfeb6fc79da7f955e638"
        let index: Int64 = 0
        NeoClient.sharedTest.getTransactionOutput(with: hash, and: index) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let value):
                print(value)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetAssets() {
        let exp = expectation(description: "Wait for asset response")
    
        NeoClient.sharedTest.getAssets(for: "AY4QCsLjUmfkMa775R9Exs85QMpAu6hyPZ", params: []) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let value):
                print(value)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetBestNode() {
        let exp = expectation(description: "Wait for asset response")
        
        NeoClient.sharedTest.getBestNode() { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let value):
                print(value)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }

    
    //I am exposing the following private keys for testing purposes only
    //Please only use them them to send transactions between each other on
    //the test network, and for the love of god never use them for real funds
    
    // TESTPRIVATEKEY1 -> DO NOT USE FOR REAL FUNDS EVER
    //      d59208b9228bff23009a666262a800f20f9dad38b0d9291f445215a0d4542beb        HEX
    //      L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL                    WIF
    //      AMpupnF6QweQXLfCtF4dR45FDdKbTXkLsr                                  ADDRESS
    //      0398b8d209365a197311d1b288424eaea556f6235f5730598dede5647f6a11d99a   PUBKEY
    // TESTPRIVAATEKEY2 -> DO NOT USE FOR REAL FUNDS EVER
    //      e444ec65fbb94aac0e7fc6bd7f0de64f22513d50c022d3d6e159c24e90b54d8d        HEX
    //      L4sSGSGh15dtocMMSYS115fhZEVN9UuETWDjgGKu2JDu59yncyVf                    WIF
    //      ATLoURz25z4PpsrzZmnowRT3dya44LGEpS                                  ADDRESS
    //      03aa0047673b0bf10f936bb45a909bc70eeef396de934429c796ad496d94911820   PUBKEY
    func testSendNeoTransaction() {
        let wifPersonA = "L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL"
        let wifPersonB = "L4sSGSGh15dtocMMSYS115fhZEVN9UuETWDjgGKu2JDu59yncyVf"
        guard let accountA = Account(wif: wifPersonA),
            let accountB = Account(wif: wifPersonB) else {
                assert(false)
                return
        }
        
        let exp1 = expectation(description: "Wait for transaction one to go through")
        let exp2 = expectation(description: "Wait for transaction two to go through")

        accountA.sendAssetTransaction(asset: .neoAssetId, amount: 1, toAddress: accountB.address) { success, error in
            assert(success ?? false)
            exp1.fulfill()
            accountB.sendAssetTransaction(asset: .neoAssetId, amount: 1, toAddress: accountA.address) {success, error in
                assert(success ?? false)
                exp2.fulfill()
            }
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
    /*
    func testSendGasTransactionWithAttribute() {
        let wifPersonA = "L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL"
        let wifPersonB = "L4sSGSGh15dtocMMSYS115fhZEVN9UuETWDjgGKu2JDu59yncyVf"
        guard let accountA = Account(wif: wifPersonA),
            let accountB = Account(wif: wifPersonB) else {
                assert(false)
                return
        }
        
        let exp1 = expectation(description: "Wait for transaction one to go through")
        let exp2 = expectation(description: "Wait for transaction two to go through")
        
        let attribute = TransactionAttritbute(description: "This is my message when sending gas")
        let attribute2 = TransactionAttritbute(description: "another description attribute")
        accountA.sendAssetTransaction(asset: .gasAssetId, amount: 1, toAddress: accountB.address, attributes: [attribute, attribute2]) { success, error in
            assert(success ?? false)
            exp1.fulfill()
            accountB.sendAssetTransaction(asset: .gasAssetId, amount: 1, toAddress: accountA.address) {success, error in
                assert(success ?? false)
                exp2.fulfill()
            }
        }
        waitForExpectations(timeout: 60, handler: nil)
    }*/
    
    
    func testSendGasTransaction() {
        let wifPersonA = "L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL"
        let wifPersonB = "L4sSGSGh15dtocMMSYS115fhZEVN9UuETWDjgGKu2JDu59yncyVf"
        guard let accountA = Account(wif: wifPersonA),
            let accountB = Account(wif: wifPersonB) else {
                assert(false)
                return
        }
        
        let exp1 = expectation(description: "Wait for transaction one to go through")
        let exp2 = expectation(description: "Wait for transaction two to go through")
        
        accountA.sendAssetTransaction(asset: .gasAssetId, amount: 1, toAddress: accountB.address) { success, error in
            assert(success ?? false)
            exp1.fulfill()
            accountB.sendAssetTransaction(asset: .gasAssetId, amount: 1, toAddress: accountA.address) {success, error in
                assert(success ?? false)
                exp2.fulfill()
            }
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    func testGetClaimsTransaction() {
        let wifPersonA = "L4Ns4Uh4WegsHxgDG49hohAYxuhj41hhxG6owjjTWg95GSrRRbLL"
        guard let accountA = Account(wif: wifPersonA) else {
            assert(false)
            return
        }
        let exp = expectation(description: "Wait for fas claim to complete")
        accountA.claimGas { result, error in
            assert(result!)
            exp.fulfill()
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
  
    func testValidateAddress() {
        let exp = expectation(description: "Wait for validate address response")
        NeoClient.sharedTest.validateAddress("AKcm7eABuW1Pjb5HsTwiq7iARSatim9tQ6") { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let isValid):
                print(isValid)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetAccountState() {
        let exp = expectation(description: "Wait for GetAccountState response")
        let address = "AUkVH4k8gPowAEpvQVAmNEkriX96CrKzk9"
        
        NeoClient.sharedTest.getAccountState(for: address) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let accountState):
                print(accountState)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetAssetState() {
        let exp = expectation(description: "Wait for GetAssetState response")
        let asset = "0xc56f33fc6ecfcd0c225c4ab356fee59390af8560be0e930faebe74a6daff7c9b"
        
        NeoClient.sharedTest.getAssetState(for: asset) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let assetState):
                print(assetState)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testGetTransactionHistory() {
        let exp = expectation(description: "Wait for TransactionHistory Response")
        let address = "AMpupnF6QweQXLfCtF4dR45FDdKbTXkLsr"
        
        NeoClient.sharedTest.getTransactionHistory(for: address) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let history):
                print(history)
                exp.fulfill()
                return
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
}
