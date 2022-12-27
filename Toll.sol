// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Toll {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    struct Road {
        address driver;
        string roadId;
        string state;
        string vehicle;
        bool passed;
    }

    mapping(address => Road) public roadReg;

    function setDriver(
        address _driver,
        string memory _roadId,
        string memory _state,
        string memory _vehicle
    )
    external {
        roadReg[msg.sender].driver = _driver;
        roadReg[msg.sender].roadId = _roadId;
        roadReg[msg.sender].state = _state;
        roadReg[msg.sender].vehicle = _vehicle;
        roadReg[msg.sender].passed = false;
    }

    function payToll() external payable {
        require(msg.value == 2 ether, "please submit 2 ether");
        owner.transfer(msg.value);
        roadReg[msg.sender].passed = true;
    }
}