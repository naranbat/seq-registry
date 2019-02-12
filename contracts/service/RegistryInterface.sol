pragma solidity ^0.5.2;

interface RegistryInterface {
    function check(address account) external view returns (uint8);
    function add(address account, uint8 status) external returns (bool);
    function update(address account, uint8 status) external returns (bool);
    function remove(address account) external returns (bool);

    event Add(address indexed account, uint8 status, address indexed operator);
    event Update(address indexed account, uint8 old_status, uint8 new_status, address indexed operator);
    event Remove(address indexed account, address indexed operator);
}