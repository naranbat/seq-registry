pragma solidity ^0.5.2;

import "./RegistryInterface.sol";
import "../access/roles/OperatorRole.sol";

contract Registry is RegistryInterface, OperatorRole {
    mapping (address => uint256) private _accounts;

    function check(address account) public view returns (uint256) {
        return _accounts[account];
    }

    function register(address account, uint256 status) public onlyOperator returns (bool) {
        _accounts[account] = status;
        emit Register(account, status, msg.sender);
        return true;
    }

    function update(address account, uint256 status) public onlyOperator returns (bool) {
        uint256 old_status = _accounts[account];
        _accounts[account] = status;
        emit Update(account, old_status, status, msg.sender);
        return true;
    }

    function remove(address account) public onlyOperator returns (bool) {
        delete _accounts[account];
        emit Remove(account, msg.sender);
        return true;
    }
}