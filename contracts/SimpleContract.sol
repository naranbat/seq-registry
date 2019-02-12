pragma solidity ^0.5.2;

import "./service/RegistryInterface.sol";

contract SimpleContract {
    address private _registryAddress;
    
    function changeRegistry(address registry) public returns (bool) {
        _registryAddress = registry;
        return true;
    }

    function check(address account) public view returns (uint256) {
        RegistryInterface _registry = RegistryInterface(_registryAddress);
        // return _registry.check(account);
        require(_registry.check(account) >= 0x10);
        
        return _registry.check(account);
    }
}