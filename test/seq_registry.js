const SEQRegistry = artificats.require("./SEQRegistry.sol");

contract("SEQ Registry test", accounts => {
    it("SEQ Registry Contract is ready", async () => {
        let instance = await SEQRegistry.deployed();

        let r0 = await instance.isOperator.call(accounts[0]);
        assert.equal(r0, true, "accounts[0] isn't in _Operators");

        let r1 = await instance.isOperator.call(accounts[1]);
        assert.equal(r1, false, "accounts[1] is in _Operators");
    });

    it("Check registering and removing an operator", async () => {
        let instance = await SEQRegistry.deployed();
        
        let r0 = await instance.isOperator.call(accounts[2]);

        await instance.addOperator.call(accounts[2]);
        let r2 = await instance.isOperator.call(accounts[2]);

        assert.equal(r0, false, "accounts[2] is already in _Operators");
        assert.equal(r1, true, "accounts[2] isn't in _Operators");
    });
});