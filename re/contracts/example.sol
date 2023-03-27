pragma solidity 0.8.7;

contract Greeter {
    bool flag;
    string greeting;

    constructor(string memory _greeting) public {
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    function eq() public {
        string memory expected = "HelloChainFlag";

        flag = (keccak256(abi.encodePacked(expected)) == keccak256(abi.encodePacked(greeting)));
    }

    function isSolved() public view returns (bool) {
        return flag;
    }
}