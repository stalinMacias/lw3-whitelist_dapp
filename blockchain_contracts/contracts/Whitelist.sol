// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Whitelist {

  // Maximum number of address to be added in the whitelist
  uint public maxWhitelistAddresses;

  // Whitelist
  mapping(address => bool) public whitelistedAddresses;

  // Total number of addresses added to the whitelist
  uint public numAddressesWhitelisted;

  constructor(uint _maxWhitelistAddresses) {
    maxWhitelistAddresses = _maxWhitelistAddresses;
  }

  function getRemainingPlaces() public view returns (uint) {
    return (maxWhitelistAddresses - numAddressesWhitelisted);
  }

  function addAddressToWhitelist() public {
    require(!whitelistedAddresses[msg.sender] , "Sender has already been whitelisted");
    require(numAddressesWhitelisted < maxWhitelistAddresses, "More addresses cant be added, limit reached");
    whitelistedAddresses[msg.sender] = true;
    numAddressesWhitelisted++;
  }

}