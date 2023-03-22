pragma solidity ^0.8.0;

contract Hexp {
    address public immutable target;

    event Success(address winner);

    constructor() {
        bytes memory code = hex"3d602d80600a3d3981f362ffffff80600a43034016903a1681146016576033fe5b6000f3";
        address child;
        assembly {
            child := create(0, add(code, 0x20), mload(code))
        }
        target = child;
    }

    function isSolved() external returns (bool) {
        (bool succ, bytes memory ret) = target.call(hex"");
        assert(succ);
        emit Success(msg.sender);
        return true;
    }
}
