pragma solidity ^0.5.2;

import "./RegistryInterface.sol";
import "../access/roles/OperatorRole.sol";

contract Registry is RegistryInterface, OperatorRole {
    mapping (address => uint8) private _accounts;

    function check(address account) public view returns (uint8) {
        return _accounts[account];
    }

    function add(address account, uint8 status) public onlyOperator returns (bool) {
        _accounts[account] = status;
        emit Add(account, status, msg.sender);
        return true;
    }

    function update(address account, uint8 status) public onlyOperator returns (bool) {
        uint8 old_status = _accounts[account];
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