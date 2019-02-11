pragma solidity ^0.5.2;

interface RegistryInterface {
    function check(address account) external view returns (uint256);
    function add(address account, uint8 status) external returns (bool);
    function update(address account, uint8 status) external returns (bool);
    function remove(address account) external returns (bool);

    event Added(address indexed account, uint8 status, address indexed operator);
    event Updated(address indexed account, uint8 old_status, uint8 new_status, address indexed operator);
    event Removed(address indexed account, address indexed operator);
}