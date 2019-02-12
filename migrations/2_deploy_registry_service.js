const SEQRegistry = artifacts.require("./SEQRegistry.sol");

module.exports = function(deployer) {
    deployer.deploy(SEQRegistry);
}