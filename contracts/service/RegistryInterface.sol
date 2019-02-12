pragma solidity ^0.5.2;

interface RegistryInterface {
    function check(address account) external view returns (uint256);
    function register(address account, uint256 status) external returns (bool);
    function update(address account, uint256 status) external returns (bool);
    function remove(address account) external returns (bool);

    event Register(address indexed account, uint256 status, address indexed operator);
    event Update(address indexed account, uint256 old_status, uint256 new_status, address indexed operator);
    event Remove(address indexed account, address indexed operator);
}