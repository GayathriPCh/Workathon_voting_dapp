const Voting = artifacts.require("Voting");

module.exports = function(deployer) {
deployer.deploy(Voting, [web3.utils.asciiToHex('Alice'), 
web3.utils.asciiToHex('Bob')]);
};