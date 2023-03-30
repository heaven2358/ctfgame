pragma solidity ^0.8.0;

contract AllinOne {
    
    uint256 public constant AMOUNT = 0x100000000000000000000000000000000000000000000000000000000000000;
    address public owner;

    constructor() {
        owner = msg.sender;
    }


    function isSolved() public view returns (bool) {
        return owner.balance > AMOUNT;
    }
}